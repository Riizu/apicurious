class RiotService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://na.api.pvp.net/api/lol/")
    @connection.params["api_key"] = ENV["riot_api"]
  end

  def versions
    global_connection = Faraday.new("https://global.api.pvp.net/api/lol")
    response = global_connection.get("static-data/na/v1.2/versions?api_key=#{ENV['riot_api']}")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
