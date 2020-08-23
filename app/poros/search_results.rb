class SearchResults
  def top_rated
    response = conn.get('movie/top_rated') do |f|
    end
    json = JSON.parse(response.body, symbolize_names: true)
    @top_rated_movies = json[:results].map do |top_rated_movie|
      Movie.new(top_rated_movie)
    end
  end

  def movie_search(search_query)
    if search_query != nil
      response = conn.get('search/movie') do |f|
        f.params['api_key'] = ENV['MOVIE_KEY']
        f.params['query'] = search_query
      end
      json = JSON.parse(response.body, symbolize_names: true)
      @movie_results = json[:results].map do |movie_result|
        @movie = Movie.new(movie_result)
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
