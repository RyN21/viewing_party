require 'rails_helper'

RSpec.describe "Discover Page" do
  describe 'After authenticating' do
    before :each do
      visit root_path
      stub_omniauth
      click_link "Login with Google"
      click_link "Discover Movies"
      fill_in :search_query, with: "Gladiator"
      click_button "Find Movies"
      first(:link, "Gladiator").click
    end

    it 'Has movies attributes' do
      within ".summary" do
        expect(page).to have_content("In the year 180")
      end

      within ".genres" do
        expect(page).to have_content("Action")
        expect(page).to have_content("Drama")
        expect(page).to have_content("Adventure")
      end

      within ".average-rating" do
        expect(page).to have_content("8.2/10")
      end

      within ".runtime" do
        expect(page).to have_content("2 hr 35 min")
      end

      within ".total-votes" do
        expect(page).to have_content("12296")
      end

      within ".cast" do
        expect(page).to have_content("Russell Crowe as Maximus Decimus Meridius")
        expect(page).to have_content("Joaquin Phoenix as Commodus")
      end

      within ".reviews" do
        expect(page).to have_content("Review Count: 3")
        expect(page).to have_content("Author: Eky")
        expect(page).to have_content("Gladiator has been my most favorite film of all time.")
      end

    end
  end
end
