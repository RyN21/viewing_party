class SessionsController < ApplicationController
  def create(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.email = auth.info.email
      user.profile = auth.info.profile
      user.openid = auth.info.openid
      user.google_token = auth.info.google_token
      user.google_refresh_token = auth.info.google_refresh_token
    end
  end


  def googleAuth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    log_in(user)
    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to root_path
  end
end
