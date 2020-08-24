class SessionsController < ApplicationController
  def create
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)
    session[:user_uid] = user.uid
    user.google_token = access_token.credentials.token
    user.name = access_token.info.name
    user.email = access_token.info.email
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to '/user'
  end
end
