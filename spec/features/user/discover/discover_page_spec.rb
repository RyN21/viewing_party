# require 'rails_helper'
#
# RSpec.describe "Discover Page" do
#   before :each do
#     @user = User.create(name: 'person@example.com', email: 'person@example.com')
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
#   end
#   it "As a user" do
#     save_and_open_page
#     visit '/'
#     click_button "Discover Movies"
#
#     expect(current_path).to eq('/user/discover')
#
#     expect(page).to have_button('Find Top Rated Movies')
#
#     within ".find_movie_form" do
#       expect(page).to have_button("Find Movies")
#     end
#   end
# end
