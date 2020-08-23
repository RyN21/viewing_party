class User::MoviesController < ApplicationController
  def index
    search_results = SearchResults.new
    search_query = params[:search_query]
    @top_rated_movies = search_results.top_rated
    @movie_search = search_results.movie_search(search_query)
  end

  def show
    get_movies
    get_credits
    get_reviews
  end

  private

  def conn
    Faraday.new('https://api.themoviedb.org/3/') do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
    end
  end

  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_movies
    movie_id = params[:id].to_i
    response = conn.get("movie/#{movie_id}") do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
      f.params['movie_id'] = movie_id
    end
    movie_attributes = JSON.parse(response.body, symbolize_names: true)
      @movie = Movie.new(movie_attributes)
  end

  def get_credits
    movie_id = params[:id].to_i
    response = conn.get("movie/#{movie_id}/credits") do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
      f.params['movie_id'] = movie_id
    end
    movie_attributes = JSON.parse(response.body, symbolize_names: true)
      @movie = Movie.new(movie_attributes)
  end

  def get_reviews
    movie_id = params[:id].to_i
    response = conn.get("movie/#{movie_id}/reviews") do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
      f.params['movie_id'] = movie_id
    end
    movie_attributes = JSON.parse(response.body, symbolize_names: true)
      @movie = Movie.new(movie_attributes)
  end
end
