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

    it 'I can view and individual viewing party' do
      duration = "155"
      date = "2020-08-27"
      time = "17:59"
      
      click_link "Create Viewing Party"

      fill_in :party_duration, with: duration
      fill_in :party_when, with: date
      fill_in :party_time, with: time
      click_button "Create Party"

      click_link "Party on '2020-08-27'"

      expect(page).to have_content("Movie: Gladiator")
      expect(page).to have_content(time)
      expect(page).to have_content(time)
      expect(page).to have_content(duration)
    end
  end
end
