require 'rails_helper'

describe "Navigation links" do
  it "allows user to go from movie details to movie list page" do
    movie= Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end

  it "allows user to go from movie list to movie details page" do
    movie= Movie.create(movie_attributes)

    visit movies_url

    click_link movie.title

    expect(current_path).to eq(movie_path(movie))
  end
end
