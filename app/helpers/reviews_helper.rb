module ReviewsHelper
  def display_stars(review)
    content_tag(:strong, "⭐" * review.stars)
  end
end
