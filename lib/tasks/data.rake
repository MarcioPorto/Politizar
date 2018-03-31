require 'nokogiri'
require 'open-uri'

namespace :data do
  desc "Retrieves basic data about a Brazilian senator."
  task fetch_brazilian_senators: :environment do
    brazil = Country.where(name: 'Brasil').first

    unless brazil.nil?
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

        # TODO: create party if it doesn't exist yet

        # TODO: save this data or update exisiting object appropriatelly
      end
    end

    # TODO: There is no Brazil
  end

  desc "Retrieves voting data for a Brazilian senator."
  task fetch_brazilian_senators_votes: :environment do
    min_date = Date.today.to_date - 10

    # TODO: Only get the senators here
    reps = Representative.all
    reps.each do |rep|
      page = Nokogiri::XML(open(
        'http://legis.senado.leg.br/dadosabertos/senador/' + rep.identifier.to_s + '/votacoes'
      ))

      votes = page.css('Votacao')
      votes.each do |vote|
        vote_date = Date.parse vote.css('DataSessao').text
        if vote_date >= min_date
          RecentVote.create(
            description: vote.css('DescricaoVotacao').text,
            vote: vote.css('DescricaoVoto').text,
            result: vote.css('DescricaoResultado').text,
            description_of_result: vote.css('TextoTramitacao').text,
            vote_date: vote_date,
            representative_id: rep.id
          )
        end
      end
    end
  end
end
