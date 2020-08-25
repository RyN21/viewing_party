class Review
  attr_reader :author, :content, :total_results

  def initialize(review_author, review_content, total_results)
    @author = review_author
    @content = review_content
    @total_results = total_results
  end
end
