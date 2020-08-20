class User::DiscoverController < ApplicationController
  def index
    conn = Faraday.new('https://api.themoviedb.org/3') do |f|
      f.params['api_key'] = ENV["MOVIE_API_KEY"]
    end
    require "pry"; binding.pry
  end
end
