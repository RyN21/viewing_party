require 'rails_helper'

RSpec.describe "Welcome page" do
  it "as a visitor I can see the welcome page" do
      visit "/"

      expect(page).to have_content("Welcome to the Viewing Party! This app streamlines your video watching experience!")
      expect(page).to have_link("Login")
  end
end
