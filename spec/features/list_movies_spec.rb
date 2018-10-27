require 'rails_helper'

describe "the movie list" do
  it "does not show movies that have not been released yet" do
    movie = Movie.create(movie_attributes(released_on: 1.month.from_now))

    visit movies_path

    expect(page).not_to have_text(movie.title)
  end
end
