class User::FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  def create
    friend_email = params[:user][:email]
    user = User.find_by(username: friend_email)
    require "pry"; binding.pry
    @new_friendships = Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
    redirect_to user_path
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to(request.referer)
  end
end
