require 'rails_helper'

RSpec.describe SummonerService do
  it "inherits from RiotService" do
    expect(described_class.superclass).to eq RiotService
  end

  it "pulls data for a single summoner" do
    ss = SummonerService.new

    result = ss.find_summoners("Riizu")
    expect(result).to eq ({"riizu"=>{"id"=>20257398,
                                     "name"=>"Riizu",
                                     "profileIconId"=>780,
                                     "summonerLevel"=>30,
                                     "revisionDate"=>1463806535000
                                    }})
  end

  it "pulls data for multiple summoners" do
    ss = SummonerService.new

    result = ss.find_summoners("Riizu,CaffeineCrab")
    expect(result).to eq ({"riizu"=>
                            {"id"=>20257398,
                             "name"=>"Riizu",
                             "profileIconId"=>780,
                             "summonerLevel"=>30,
                             "revisionDate"=>1463806535000
                            },
                          "caffeinecrab"=>
                            {"id"=>22834072,
                             "name"=>"Caffeine Crab", 
                             "profileIconId"=>1149,
                             "summonerLevel"=>30,
                             "revisionDate"=>1468257694000}
                          })
  end
end
