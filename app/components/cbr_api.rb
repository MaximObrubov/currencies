module CBR_API
  
  require 'net/http'
  
  # returns parsed CBR currency cources relatively to RUB
  def self.courses
    raise Error.new("No API url") unless CBR_API_URL
    request(url: CBR_API_URL)
  end
  
  # makes get request via Net::HTTP
  # Params:
  # +url+::  `:string` address to be requested
  def self.request url:
    uri = URI(url)
    req = Net::HTTP::Get.new(uri, 'Content-Type' => 'application/json')
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => (uri.scheme == 'https')) do |http|
      http.request(req)
    end
    
    unless res.is_a?(Net::HTTPSuccess)
      raise Error.new("`#{uri.host}` has returned bad status")
    end
    
    JSON.parse(res.body, symbolize_names: true)
  end
  
  class Error < StandardError; end
end