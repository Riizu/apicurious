class Summoner < OpenStruct
  def self.service
    @@service ||= SummonerService.new
  end

  def self.find_summoners(names)
    summoners_hash = service.find_summoners(names)

    summoners_hash.map do |summoner, summoner_hash|
      Summoner.new(summoner_hash)
    end
  end
end
