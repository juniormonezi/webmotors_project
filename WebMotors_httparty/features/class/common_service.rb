class CommonService
  include LoadFile

  def search(url)
    HTTParty.get(url)
  end
end
