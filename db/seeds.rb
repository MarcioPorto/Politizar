# Coutries
brazil = Country.create(name: 'Brasil')

# Regions
brazilian_states = [
  'Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará',
  'Distrito Federal', 'Espírito Santo', 'Goiás', 'Maranhão',
  'Mato Grosso', 'Mato Grosso do Sul', 'Minas Gerais', 'Pará',
  'Paraíba', 'Paraná', 'Pernambuco', 'Piauí', 'Rio de Janeiro',
  'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia', 'Roraima',
  'Santa Catarina', 'São Paulo', 'Sergipe', 'Tocantins'
]

brazilian_states_abbr = [
  'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA',
  'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN',
  'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
]

i = 0
brazilian_states.each do |state|
  Region.create(
    name: state,
    country_id: brazil.id,
    abbreviation: brazilian_states_abbr[i]
  )
  i += 1
end

# Institutions
Institution.create(
  name: 'Senado',
  member: 'senador',
  member_plural: 'senadores',
  country_id: brazil.id
)
