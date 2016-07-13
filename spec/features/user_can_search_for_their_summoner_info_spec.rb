require 'rails_helper'

RSpec.feature "A user can search for their summoner information" do
  include IntegrationSpecHelper

  context "Valid" do
    scenario "They search for a summoner" do
      stub_omni_auth
      login_with_oauth

      fill_in "Summoner Names:", with: "Riizu"
      click_on "Search"

      expect(current_path).to eq "/summaries"

      within(".summoner-20257398") do
        expect(page.find('#summoner-avatar')['src']).to have_content("http://ddragon.leagueoflegends.com/cdn/6.14.2/img/profileicon/780.png")
        expect(page).to have_content("Summoner: Riizu")
        expect(page).to have_content("Level: 30")
      end
    end

    scenario "They search for multiple summoners" do
      stub_omni_auth
      login_with_oauth

      fill_in "Summoner Names:", with: "Riizu,CaffeineCrab"
      click_on "Search"

      within(".summoner-20257398") do
        expect(page.find('#summoner-avatar')['src']).to have_content("http://ddragon.leagueoflegends.com/cdn/6.14.2/img/profileicon/780.png")
        expect(page).to have_content("Summoner: Riizu")
        expect(page).to have_content("Level: 30")
      end

      within(".summoner-22834072") do
        expect(page.find('#summoner-avatar')['src']).to have_content("http://ddragon.leagueoflegends.com/cdn/6.14.2/img/profileicon/1149.png")
        expect(page).to have_content("Summoner: Caffeine Crab")
        expect(page).to have_content("Level: 30")
      end
    end
  end

  context "Invalid" do
    scenario "They do not enter a summoner name" do
      stub_omni_auth
      login_with_oauth

      fill_in "Summoner Names:", with: ""
      click_on "Search"

      expect(current_path).to eq "/"
    end
  end
end
