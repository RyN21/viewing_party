class Review
  attr_reader :author, :content, :total_results

  def initialize(review)
    @author = review[:results][0][:author]
    @content = review[:results][0][:content]
    @total_results = review[:total_results]
  end
end
