class User::FriendshipsController < ApplicationController
  before_action :require_current_user
  protect_from_forgery with: :exception

  def create
    if params[:username]
      user = current_user
      friend = User.find_by(username: params[:username])
      Friendship.create(user: user, friend: friend)
      Friendship.create(user: friend, friend: user)
    else
      redirect_to users_path
      flash[:error] = 'Could not find user with that email'
    end
    redirect_to '/user'
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to(request.referer)
  end
end
