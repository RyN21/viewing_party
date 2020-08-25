class User::DashboardController < ApplicationController
  def index
    @user = current_user
    @parties = current_user.parties
  end
end
