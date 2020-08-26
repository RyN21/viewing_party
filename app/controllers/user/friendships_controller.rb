class User::FriendshipsController < ApplicationController
  before_action :require_current_user
  protect_from_forgery with: :exception

  def create
    if User.where(username: params[:username]).present?
      user = current_user
      friend = User.find_by(username: params[:username])
      Friendship.create(user: user, friend: friend)
      Friendship.create(user: friend, friend: user)
    else
      flash[:error] = 'Could not find user with that email'
      redirect_to user_path
    end
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to(request.referer)
  end
end
