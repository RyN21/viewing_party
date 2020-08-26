require 'rails_helper'

RSpec.describe "User Dashboard" do
  describe 'After authenticating' do
    before :each do
      stub_omniauth
      @john = create(:omniauth_mock_user)
      visit root_path
      click_link "Login with Google"
    end

    it 'I should be redirected to the dashboard page' do
      expect(current_path).to eq(user_path)
    end

    it 'I should see a welcome message' do
      expect(page).to have_content("Welcome #{@john.name}")
    end

    it 'I should see a link to discover movies' do
      expect(page).to have_link("Discover Movies")
    end

    it 'I should see a friends section' do
      within '.friends' do
        expect(page).to have_content("Friends")
      end
    end

    it 'I should see a viewing parties section' do
      within '.viewing-parties' do
        expect(page).to have_content("Viewing Parties")
      end
    end
  end
end
