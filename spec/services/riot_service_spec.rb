require 'rails_helper'

RSpec.describe RiotService do
  it "has a connection" do
    rs = RiotService.new
    url_prefix = rs.connection.url_prefix.to_s
    api_key = rs.connection.params["api_key"]

    expect(url_prefix).to eq "https://na.api.pvp.net/api/lol/"
    expect(api_key).to eq ENV["riot_api"]
  end

  it "parses faraday responses" do
    rs = RiotService.new
    response = Faraday.get("https://global.api.pvp.net/api/lol/static-data/na/v1.2/versions?api_key=#{ENV['riot_api']}")
    result = rs.parse(response)

    expect(result.class).to eq Array
  end

  it "authenticates with riot to pull versions" do
    rs = RiotService.new
    result = rs.versions

    expect(result.count).to be > 0
    expect(result.class).to eq Array
  end


end
