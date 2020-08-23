class Movie
  def initialize(movie_result)
    id = movie_result[:id]
    genres = movie_result[:genre_ids]
    title = movie_result[:title]
    overview = movie_result[:overview]
    vote_count = movie_result[:vote_count]
    vote_average = movie_result[:vote_average]
    require "pry"; binding.pry
  end
end
