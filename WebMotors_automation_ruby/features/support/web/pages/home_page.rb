class HomePage < BasePage
  attr_reader :btn_ofertas, :access_store

  def initialize
  @btn_ofertas = EL['btn_ofertas']
  @access_store = EL['access_store']
  end

  def btn_result_ofertas
  find(btn_ofertas).click
  end

  def store_access
    visit('/carros/estoque/?IdRevendedor=3834764&TipoVeiculo=carros&anunciante=concession%C3%A1ria%7Cloja')
  end
end