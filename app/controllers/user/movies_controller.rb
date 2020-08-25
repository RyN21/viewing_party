class User::MoviesController < ApplicationController
  def index
    search_results = SearchResults.new
    search_query = params[:search_query]
    @top_rated_movies = search_results.top_rated
    @movie_search = search_results.movie_search(search_query)
  end

  def show
    movie_id = params[:id].to_i
    movie_response = conn.get("movie/#{movie_id}") do |f|
      f.params['movie_id'] = movie_id
    end
    movie_json = JSON.parse(movie_response.body, symbolize_names: true)
    @movie = Movie.new(movie_json)

    credit_response = conn.get("movie/#{movie_id}/credits") do |f|
      f.params['movie_id'] = movie_id
    end
    credit_json = JSON.parse(credit_response.body, symbolize_names: true)
    credit_json[:cast].each do |member|
      @credits = credit_json[:cast].map do |credit|
        member_name = credit[:name]
        member_character = credit[:character]
        Credit.new(member_name, member_character)
      end
    end

    review_response = conn.get("movie/#{movie_id}/reviews") do |f|
      f.params['movie_id'] = movie_id
    end
    review_json = JSON.parse(review_response.body, symbolize_names: true)
    @reviews = review_json
    review_json[:results].each do |review|
      review_author = review[:author]
      review_content = review[:content]
      total_results = @reviews[:total_results]
      if @reviews[:total_results] >= 1
        @review = Review.new(review_author, review_content, total_results)
      end
    end
  end

  private

  def conn
    Faraday.new('https://api.themoviedb.org/3/') do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
    end
  end
end
