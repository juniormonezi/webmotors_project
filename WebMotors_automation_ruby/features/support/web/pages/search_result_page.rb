require_relative 'base_page.rb'

class SearchResultPage < BasePage
    attr_reader :validate_title, :search_marca_honda, :search_modelo, :set_modelo_city,
                :search_versao, :input_versao, :set_versao

  def initialize
    @validate_title = EL['validate_title']
    @search_marca_honda = EL['search_marca_honda']
    @search_modelo = EL['search_modelo']
    @set_modelo_city = EL['set_modelo_city']
    @search_versao = EL['search_versao']
    @input_versao = EL['input_versao']
    @set_versao = EL['set_versao']
  end

  def wait_to_validate_title
    page.assert_text('Carros Novos e Usados em Todo o Brasil')
  end

  def set_type
    find(search_marca_honda).click
  end

  def search_model
    find(search_modelo).click
    find(set_modelo_city).click
  end

  def set_version(element)
    find(search_versao).click
    find(input_versao).set(element)
    find(set_versao).click
  end
end
