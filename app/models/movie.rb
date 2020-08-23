class Movie
  attr_reader :id,
              :genres,
              :title,
              :overview,
              :vote_count,
              :vote_average

  def initialize(attributes)
    @id = attributes[:id]
    @genres = attributes[:genre_ids]
    #need genre ids to proper genres
    @title = attributes[:title]
    @overview = attributes[:overview]
    @vote_count = attributes[:vote_count]
    @vote_average = attributes[:vote_average]
  end
end
