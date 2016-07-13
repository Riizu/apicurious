class SummariesController < ApplicationController
  def index
    if !(params[:summoner_names].blank?)
      @summoners = Summoner.find_summoners(params[:summoner_names])
    else
      redirect_to root_path
    end
  end
end
