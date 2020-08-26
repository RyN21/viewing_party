class User::DashboardController < ApplicationController
  before_action :require_current_user
  def index
    @user = current_user
    @friends = @user.friends
  end
end
