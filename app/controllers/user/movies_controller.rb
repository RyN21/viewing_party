class User::MoviesController < ApplicationController
  def index; end

  def show
    movie_id = params[:id].to_i

    movie_response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}") do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
      f.params['movie_id'] = movie_id
    end

    @movie = JSON.parse(movie_response.body, symbolize_names: true)

    credit_response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits") do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
      f.params['movie_id'] = movie_id
    end

    @credit = JSON.parse(credit_response.body, symbolize_names: true)

    review_response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews") do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
      f.params['movie_id'] = movie_id
    end

    @review = JSON.parse(review_response.body, symbolize_names: true)
  end
end
