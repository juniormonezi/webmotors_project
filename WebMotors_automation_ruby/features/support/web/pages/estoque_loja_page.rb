require_relative 'base_page.rb'

class EstoqueLojaPage < BasePage
  attr_reader :input_model, :search_marca_honda, :search_modelo, :set_city_model,
              :search_versao, :input_versao, :set_versao_estoque, :validate_css_text

  def initialize
    @search_marca_honda = EL['search_marca_honda']
    @search_modelo = EL['search_modelo']
    @input_model = EL['input_model']
    @set_city_model = EL['set_city_model']
    @search_versao = EL['search_versao']
    @input_versao = EL['input_versao']
    @set_versao_estoque = EL['set_versao_estoque']
    @validate_css_text = EL['validate_css_text']
  end

  def set_model(element)
    find(search_marca_honda).click
    find(search_modelo).click
    find(input_model).set(element)
    find(set_city_model).click
  end

  def set_version
    find(search_versao).click
    find(set_versao_estoque).click
  end

  def validate_text
    page.assert_text('Marca do carro')
  end

  def validate_css
    find(validate_css_text).text
  end
end