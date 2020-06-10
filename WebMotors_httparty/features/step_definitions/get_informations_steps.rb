Dado('a API da webmotors') do
  @url_base = get_information.construct_base_url
end

Quando('realizar uma pesquisa por {string} com o valor {string}') do |consult, value|
  @response = get_information.informations(@url_base, consult, value)
end

Então('o sistema deve retornar as informações cadastradas na base de dados juntamente com codigo de resultado da consulta {string}') do |expect_code|
  expect(@response.code.to_s).to eql(expect_code)
end
