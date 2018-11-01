require "rails_helper"

describe "Deleting a movie" do
  it "removes the movie from the db and shows an updated index page" do
    movie = Movie.create(movie_attributes)

    visit movie_path(movie)

    click_link 'Delete'

    expect(current_path).to eq(movies_path)
    expect(page).to have_text('Movie successfully deleted!')
    expect(page).not_to have_text(movie.title)
  end
end
