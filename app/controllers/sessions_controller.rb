class SessionsController < ApplicationController
  def create
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)
    session[:user_id] = user.id
    user.google_token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to root_path
  end
end
