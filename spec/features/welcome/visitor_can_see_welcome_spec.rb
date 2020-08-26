require 'rails_helper'

RSpec.describe "Welcome page" do
  it "as a visitor I can see the welcome page" do
      visit "/"

      expect(page).to have_content("Welcome to the Viewing Party!")
      expect(page).to have_content("This app streamlines your video watching experience!")
  end

  it "I can sign in with Google account" do
    visit root_path
    expect(page).to have_content("Login with Google")
    stub_omniauth
    click_link "Login with Google"
    expect(current_path).to eq(user_path)
    expect(page).to have_content("Welcome John Smith!")
  end
end
