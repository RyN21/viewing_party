class User::SearchController < ApplicationController
  def index
    search_results = SearchResults.new
    @top_rated_movies = search_results.top_rated_movies
    @movie_search = search_results.movie_search
  end
  # def top_rated
  #   response = Faraday.get('https://api.themoviedb.org/3/movie/top_rated') do |f|
  #     f.params['api_key'] = ENV['MOVIE_KEY']
  #   end
  #   json = JSON.parse(response.body, symbolize_names: true)
  #   @top_rated_movies = json[:results]
  #   redirect_to 'user/search'
  # end
  #
  # def movie_search
  #   @movie = params[:search_movie]
  #
  #   response = Faraday.get('https://api.themoviedb.org/3/search/movie') do |f|
  #     f.params['api_key'] = ENV['MOVIE_KEY']
  #     f.params['query'] = @movie
  #   end
  #   json = JSON.parse(response.body, symbolize_names: true)
  #   @movie_results = json[:results]
  # end

  private

  def conn
    Faraday.new('https://api.themoviedb.org/3/') do |f|
      f.params['api_key'] = ENV['MOVIE_KEY']
    end
  end
end
