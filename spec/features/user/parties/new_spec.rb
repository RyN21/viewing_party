require 'rails_helper'

RSpec.describe "Viewing parties" do
  describe 'As a logged in user' do
    before :each do
      stub_omniauth
      @john = create(:omniauth_mock_user)
      visit root_path
      click_link "Login with Google"
      click_link "Discover Movies"
      fill_in :search_query, with: "Gladiator"
      click_button "Find Movies"
      first(:link, "Gladiator").click
    end

    it 'I can create a new viewing party from my dashboard' do
      click_link "Create Viewing Party"

      fill_in :party_duration, with: "155"
      fill_in :party_when, with: "2020-08-27"
      fill_in :party_time, with: "17:59"
      click_button "Create Party"

      expect(page).to have_content("New viewing party created")
    end
  end
end
