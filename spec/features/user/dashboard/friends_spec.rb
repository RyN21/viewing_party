require 'rails_helper'

RSpec.describe "Friends" do
  before :each do
    stub_omniauth
    @john  = create(:omniauth_mock_user)
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)
    visit '/user'
  end

  it "has a form to add friend" do
    expect(current_path).to eq('/user')
    within '.friends' do
      expect(page).to have_field('username')
    end
  end

  it "user can add friend" do
    within '.friends' do
      fill_in :username, with: "#{@user1.username}"
      click_button "Add Friend"
    end

    expect(page).to have_content("Successfully added friend")

    within '.friends' do
      fill_in :username, with: "#{@user2.username}"
      click_button "Add Friend"
    end

    within '.friends' do
      fill_in :username, with: "#{@user3.username}"
      click_button "Add Friend"
    end

    expect(current_path).to eq('/user')
    expect(page).to have_content("#{@user1.username}")
  end

  it "user cannot add friend if friend is not a registered user" do
    within '.friends' do
      fill_in :username, with: "example@turing.io"
      click_button "Add Friend"
    end

    expect(current_path).to eq(user_path)
    expect(page).to have_content("Could not find user with that email")
  end
end
