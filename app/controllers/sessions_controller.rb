class SessionsController < ApplicationController
  def create
    client_id     = ENV['GOOGLE_CLIENT_ID']
    client_secret = ENV['GOOGLE_CLIENT_SECRET']
    code          = params[:code]
    state         = params[:state]
    response      = Faraday.post("https://accounts.google.com/o/oauth2/v2/auth?
                                   scope=https%3A//www.googleapis.com/auth/drive.metadata.readonly&
                                   access_type=offline&
                                   include_granted_scopes=true&
                                   response_type=#{code}&
                                   state=#{state}&
                                   redirect_uri=https%3A//oauth2.example.com/#{code}&
                                   client_id=#{client_id}")
   binding.pry
  end
end
