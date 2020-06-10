require_relative 'common_service'

class GetInformation < CommonService
  include LoadFile

  def construct_base_url
    get_url['url']['url_base']
  end

  def construct_url_parameter(consult, value)
    case consult
    when 'marca'
      parameter = get_url['parameters']['parameter_make']
    when 'modelo'
      parameter = get_url['parameters']['parameter_model']
      parameter = parameter.gsub('id_model', value)
    when 'versao'
      parameter = get_url['parameters']['parameter_version']
      parameter = parameter.gsub('id_version', value)
    when 'veiculos'
      parameter = get_url['parameters']['parameter_vehicles']
      parameter = parameter.gsub('id_page', value)
    end
  end

  def informations(url_base, consult, value)
    url_parameter = construct_url_parameter(consult, value)
    url = url_base + url_parameter
    search(url)
  end
end
