Quando("realizo a pesquisa por {string}, {string} e {string}") do |marca, modelo, versao|
  @page.call(HomePage).btn_result_ofertas
  expect(@page.call(SearchResultPage).wait_to_validate_title).to eq true
  @page.call(SearchResultPage).set_type
  @page.call(SearchResultPage).search_model
  @page.call(SearchResultPage).set_version(versao)
end
  
Então("o sistema deverá apresentar no resultado") do |expect_result|
  expect(page).to have_content expect_result
end 

Dado("que o usuário realiza o acesso a loja") do
  @page.call(HomePage).store_access
end

Quando("realizar a pesquisa por {string} e {string} e {string}") do |marca, modelo, versao|
  @page.call(EstoqueLojaPage).validate_text
  @page.call(EstoqueLojaPage).set_model(modelo)
  @page.call(EstoqueLojaPage).set_version
end

Então("o sistema deverá apresentar no resultado do estoque da loja") do |expect_string|
  expect(@page.call(EstoqueLojaPage).validate_css).to have_content expect_string
end