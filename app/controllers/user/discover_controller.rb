class User::DiscoverController < ApplicationController
  def top_rated
    response = Faraday.get('https://api.themoviedb.org/3/movie/top_rated') do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def movie_search(movie)
    movie = params[:movie]

    response = Faraday.get('https://api.themoviedb.org/3/search/movie') do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
      f.params['query'] = movie
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
