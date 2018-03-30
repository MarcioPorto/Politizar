require 'nokogiri'
require 'open-uri'

namespace :data do
  desc "Retrieves basic data about a Brazilian senator."
  task fetch_brazilian_senators: :environment do
    page = Nokogiri::XML(open('http://legis.senado.leg.br/dadosabertos/senador/lista/atual'))

    parlamentares = page.css('Parlamentar')

    parlamentares.each do |parlamentar|
      codigo = parlamentar.css('CodigoParlamentar').first.content
      nome = parlamentar.css('NomeParlamentar').first.content
      nome_completo = parlamentar.css('NomeCompletoParlamentar').text
      sexo = parlamentar.css('SexoParlamentar').text
      posicao = parlamentar.css('FormaTratamento').text
      foto = parlamentar.css('UrlFotoParlamentar').text
      email = parlamentar.css('EmailParlamentar').text
      partido = parlamentar.css('SiglaPartidoParlamentar').text
      estado = parlamentar.css('UfParlamentar').first.content

      # Representative
      # - identifier
      # - name
      # - full_name
      # - gender
      # - position (Senador, Deputado Federal)
      # - photo
      # - email
      # - party
      # - region (PE, AL, etc...)
    end
  end
end
