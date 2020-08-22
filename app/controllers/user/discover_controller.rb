class User::DiscoverController < ApplicationController
  def top_rated
    response = Faraday.get('https://api.themoviedb.org/3/movie/top_rated') do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
    end
    json = JSON.parse(response.body, symbolize_names: true)
    @top_rated_movies = json[:results]
  end

  def movie_search
    @movie = params[:search_movie]

    response = Faraday.get("https://api.themoviedb.org/3/search/movie") do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
      f.params['query'] = @movie
    end
    json = JSON.parse(response.body, symbolize_names: true)
    @movie_results = json[:results]
  end

  def index

  end
end
