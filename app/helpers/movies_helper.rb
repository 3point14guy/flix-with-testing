module MoviesHelper
  def format_total_gross(movie)
    if movie.flop?
      content_tag(:strong, "Flop!")
    else
      number_to_currency(movie.total_gross)
    end
  end

  def image_default(movie, width, imagemagick)
    # changing bc paperclip saves files in the public folder.  exists? comes from paperclip
    if movie.image.exists?
      image_tag movie.image.url(imagemagick)
    elsif movie.image_file_name.blank?
      image_tag 'moviemarathon.png', width: width
    else
      image_tag movie.image_file_name, width: width
    end
  end

  def format_average_stars(movie)
    if movie.average_stars
      # pluralize(number_with_precision(movie.average_stars, precision: 1), "Star")
      content_tag(:strong, "⭐" * movie.average_stars)
    else
      content_tag(:strong, "No Reviews")
    end
  end
end
