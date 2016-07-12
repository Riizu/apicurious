require 'rails_helper'

RSpec.feature "A user can log in with Twitter OAuth" do
  include IntegrationSpecHelper

  context "Valid login" do
    scenario "They visit the home page" do
      stub_omni_auth

      visit '/'

      expect(current_path).to eq '/'
      expect(page).to have_content 'Login'

      click_on 'Login'

      expect(current_path).to eq '/'
      expect(page).to have_content 'Welcome, Test.'
      expect(page).to have_content 'Logout'
    end
  end
end
