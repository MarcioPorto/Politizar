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
    # 7 days ago
    min_date = Date.today.to_date - 7

    brazil = Country.where(name: 'Brasil').first
    senate = Institution.where(name: 'Senado', country: brazil).first

    # TODO: Only get the senators here
    representatives = Representative.where(institution: senate)

    representatives.each do |rep|
      page = Nokogiri::XML(open(
        'http://legis.senado.leg.br/dadosabertos/senador/' + rep.identifier + '/votacoes'
      ))

      votes = page.css('Votacao')
      votes.each do |vote|
        # vote_date = Date.parse vote.css('DataSessao').text
        # if vote_date >= min_date
        #   Vote.create(
        #     description: vote.css('DescricaoVotacao').text,
        #     vote: vote.css('DescricaoVoto').text,
        #     result: vote.css('DescricaoResultado').text,
        #     description_of_result: vote.css('TextoTramitacao').text,
        #     vote_date: vote_date,
        #     representative_id: rep.id
        #   )
        # end
      end
    end
  end
end
