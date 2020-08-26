require 'rails_helper'

RSpec.describe "Navigation" do
  describe "When not logged in" do
    before :each do
      visit root_path
      stub_omniauth
      User.create()
      click_link "Login with Google"
    end

    it "dashboard page" do
    end

    it "discover page" do
    end

    it "movie page" do
    end
  end
end
