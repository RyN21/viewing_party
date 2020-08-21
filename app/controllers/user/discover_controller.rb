class User::DiscoverController < ApplicationController
  def index
    conn = Faraday.get('https://api.themoviedb.org/3/movie/top_rated') do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
    end
    require "pry"; binding.pry
  end
end
