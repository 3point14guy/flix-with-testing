require 'rails_helper'

describe "creating a new movie" do
  it "generates a form, adds the movie to the db and then shows what was added" do

    visit movies_url

    click_link "Add a Movie"

    expect(current_path).to eq(new_movie_path)

    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "People doing stuff"
    fill_in "Rating", with: "G"
    fill_in "Total gross", with: "75000500"
    # select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    fill_in "Released on", with: (Time.now.year - 1).to_s

    click_button "Create Movie"

    expect(current_path).to eq(movie_path(Movie.last))
    expect(page).to have_text('New Movie Title')

  end
end
