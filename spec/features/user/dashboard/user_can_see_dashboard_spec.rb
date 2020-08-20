require 'rails_helper'

RSpec.describe "User Dashboard" do
  before :each do
    @user = User.create(name: 'person@example.com', email: 'person@example.com')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  it "After authenticating, I should be redirected to the dashboard page" do
    visit '/dashboard'
    expect(current_path).to eq('/dashboard')
  end
end
