require 'nokogiri'
require 'open-uri'

namespace :data do
  desc "Retrieves basic data about a Brazilian senator."
  task fetch_brazilian_senators: :environment do
    brazil = Country.where(name: 'Brasil').first
    institution = Institution.where(
      name: 'Senado', country: brazil
    ).first

    page = Nokogiri::XML(open('http://legis.senado.leg.br/dadosabertos/senador/lista/atual'))

    representatives = page.css('Parlamentar')

    representatives.each do |representative|
      identifier = representative.css('CodigoParlamentar').first.content
      name = representative.css('NomeParlamentar').first.content
      full_name = representative.css('NomeCompletoParlamentar').text
      gender = representative.css('SexoParlamentar').text
      position = representative.css('FormaTratamento').text
      photo = representative.css('UrlFotoParlamentar').text
      email = representative.css('EmailParlamentar').text
      party = representative.css('SiglaPartidoParlamentar').text
      region = representative.css('UfParlamentar').first.content

      party_obj = Party.where(name: party, country: brazil).first

      # Create party if it doesn't exist yet
      if party_obj.nil?
        party_obj = Party.create(
          name: party, country: brazil
        )
      end

      region_obj = Region.where(
        abbreviation: region, country: brazil
      ).first

      representative_obj = Representative.where(
        identifier: identifier, institution: institution
      ).first

      obj = {
        identifier: identifier,
        name: name,
        full_name: full_name,
        gender: gender, 
        photo: photo, 
        email: email,
        party: party_obj,
        region: region_obj,
        institution: institution
      }

      # Save this data or update exisiting object appropriatelly
      if representative_obj.nil?
        Representative.create(obj)
      else
        Representative.update(obj)
      end
    end
  end

  desc "Retrieves voting data for a Brazilian senator."
  task fetch_brazilian_senators_votes: :environment do
    start = Time.now

    # 14 days ago
    min_date = Date.today.to_date - 14

    brazil = Country.where(name: 'Brasil').first
    senate = Institution.where(name: 'Senado', country: brazil).first
    representatives = Representative.where(institution: senate)

    representatives.each do |rep|
      page = Nokogiri::XML(open(
        'http://legis.senado.leg.br/dadosabertos/senador/' + rep.identifier + '/votacoes'
      ))

      votes = page.css('Votacao')
      votes.each do |vote|
        vote_date = Date.parse vote.css('DataSessao').text
        
        if vote_date >= min_date
          identifier = vote.css('CodigoMateria').text

          bill = Bill.where(identifier: identifier).first

          if bill.nil?
            # Create the bill
            bill = Bill.create(
              identifier: identifier,
              description: vote.css('DescricaoVotacao').text,
              vote_date: vote_date,
              result: vote.css('DescricaoResultado').text,
              result_description: vote.css('TextoTramitacao').text,
              institution: senate
            )
          end
          
          # Only create this if it hasn't been saved already
          vote = Vote.where(representative: rep, bill: bill)

          if vote.nil?
            Vote.create(
              vote: vote.css('DescricaoVoto').text,
              representative: rep,
              bill: bill
            )
          end
        end
      end
    end

    finish = Time.now
    
    duration = finish - start
    seconds = duration % 60
    minutes = (duration - seconds) / 60

    puts "This operation took %s minutes and %s seconds." % [minutes.to_s, seconds.to_s]
  end

  desc 'Fetch Brazilian Senate projets'
  task fetch_brazilian_senate_projects: :environment do
    start = Time.now

    brazil = Country.where(name: 'Brasil').first
    senate = Institution.where(name: 'Senado', country: brazil).first
    reps = Representative.where(institution: senate)

    # Get projects updated in the last 7 days
    updated_project_identifiers = []

    doc = Nokogiri::XML(open(
      'http://legis.senado.leg.br/dadosabertos/materia/atualizadas?numdias=7'
    ))

    projects = doc.css('Materia')
    projects.each do |project|
      updated_project_identifiers.push(
        project.css('CodigoMateria').text
      )
    end

    reps.each do |rep|
      doc = Nokogiri::XML(open('http://legis.senado.leg.br/dadosabertos/senador/' + rep.identifier + '/autorias?tramitando=s'))
      
      projects = doc.css('Materia')
      
      projects.each do |project|
        project_identifier = project.css('CodigoMateria').text

        obj = {
          identifier: project_identifier,
          description: project.css('EmentaMateria').text,
          status: project.css('DescricaoSituacao').text,
          representative: rep
        }

        project = Project.where(identifier: project_identifier).first

        if updated_project_identifiers.include? project_identifier
          if project.nil?
            Project.create(obj)
          else
            project.description = obj[:description]
            project.status = obj[:status]
            project.save
          end
        end
      end
    end

    finish = Time.now
    
    duration = finish - start
    seconds = duration % 60
    minutes = ((duration - seconds) / 60).to_i.to_s
    seconds = seconds.to_i.to_s

    puts "This operation took %s minutes and %s seconds." % [minutes, seconds]
  end

  desc 'Fetch Brazilian Senate presence'
  task fetch_brazilian_senate_presence: :environment do
    # Presense data doesn't seem to be available anymore.
    # Look at politicos.org.br to find other interesting data

    start = Time.now

    brazil = Country.where(name: 'Brasil').first
    senate = Institution.where(name: 'Senado', country: brazil).first
    representatives = Representative.where(institution: senate)

    representatives.each do |rep|
      url = 'http://www.politicos.org.br/' + rep.full_name.parameterize

      total_sessions = 0
      present_sessions = 0
      justified_absences = 0
      unjustified_absences = 0
      last_presence_update = ''
      
      begin
        doc = Nokogiri::HTML(open(url))
        begin
          total_sessions = doc.at_css('#presence td:nth-child(2)').text
          present_sessions = doc.at_css('#presence td:nth-child(3)').text
          justified_absences = doc.at_css('#presence td:nth-child(4)').text
          unjustified_absences = doc.at_css('#presence td:nth-child(5)').text
          last_presence_update = doc.at_css('#presence .text-right').text
        rescue NoMethodError
          # TODO: LOG
        end
      rescue OpenURI::HTTPError
        # TODO: LOG
      rescue Errno::ETIMEDOUT
        # TODO: LOG
      end

      rep.total_sessions = total_sessions
      rep.present_sessions = present_sessions
      rep.justified_absences = justified_absences
      rep.unjustified_absences = unjustified_absences
      rep.last_presence_update = last_presence_update
      rep.save
    end
  end
end
