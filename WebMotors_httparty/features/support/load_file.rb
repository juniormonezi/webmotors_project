module LoadFile
  def get_url
    YAML.load_file("#{Dir.pwd}/features/support/config/#{ENV['ENVIRONMENT_TYPE']}.yml")
  end
end
