require 'rails_helper'

RSpec.describe "Discover Page" do
  describe 'After authenticating' do
    before :each do
      visit root_path
      mock_auth_hash
      click_link "Login with Google"
      click_link "Discover Movies"
    end

    it 'There should be a button to find top rated movies' do
      expect(page).to have_link("Find Top Rated Movies")
    end

    it "Page populates with top rated movies" do
      click_link "Find Top Rated Movies"
      expect(current_path).to eq("/user/movies")
      expect(page).to have_content("Top Rated Movies")
      expect(page).to have_content("Gabriel's Inferno Part II")
      expect(page).to have_content("Vote Average: 9.1")
    end

    it 'Should have a search bar to find movies' do
      expect(page).to have_field("search_query")
    end

    it 'Can search for movies related to search querry' do
      fill_in :search_query, with: "Gladiator"
      click_button "Find Movies"

      expect(current_path).to eq('/user/movies')
      expect(page).to have_field("search_query")
      expect(page).to have_link("Gladiator")
      expect(page).to have_content("Vote Average: 8.2")
      expect(page).to have_link("Gladiator Cop")
      expect(page).to have_content("Vote Average: 5.2")
    end
  end
end
