require 'rails_helper'

RSpec.describe "User Dashboard" do
  it "After authenticating, I should be redirected to the dashboard page" do
      visit "/"

      expect(page).to have_content("Welcome to the Viewing Party!")
      expect(page).to have_content("This app streamlines your video watching experience!")
  end
end
