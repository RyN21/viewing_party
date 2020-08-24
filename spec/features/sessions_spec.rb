require 'rails_helper'

RSpec.describe 'Sessions spec' do
  it 'logs the user in with google mock' do
    expect(User.count).to eq(0)
    stub_omniauth
    expect(User.count).to eq(0)
    visit root_path
    click_link 'Login with Google'
    require "pry"; binding.pry
    expect(User.count).to eq(1)
    user = User.first
    expect(page).to have_content("Welcome, #{user.name}")
  end

  it 'logs a returning user in with google mock' do
    stub_omniauth
    user = create(:omniauth_mock_user)
    expect(User.count).to eq(1)
    visit root_path
    click_link 'Login with Google'
    expect(User.count).to eq(1)
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, #{user.username}")
  end
end
