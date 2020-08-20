class User::DiscoverController < ApplicationController
  def index
    conn = Faraday.get('https://api.themoviedb.org/3/movie/30') do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
    end
    require "pry"; binding.pry
    # conn
  end
end
