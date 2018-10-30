require 'rails_helper'

describe "creating a new movie" do
  it "generates a form, adds the movie to the db and then shows what was added" do

    visit movies_url

    click_link "Add A Movie"

    expect(current_path).to eq(new_movie_path)

    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "People doing stuff"
    select "PG-13", from: "movie_rating"
    fill_in "Total gross", with: "75000500"
    # select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    fill_in "Released on", with: (Time.now.year - 1).to_s
    fill_in "Cast", with: "The award-winning cast"
    fill_in "Director", with: "The ever-creative director"
    fill_in "Duration", with: "123 min"
    fill_in "Image file name", with: "moviemarathon.png"

    click_button "Create Movie"

    expect(current_path).to eq(movie_path(Movie.last))
    expect(page).to have_text('New Movie Title')
    expect(page).to have_text('People doing stuff')
    expect(page).to have_text('G')
    expect(page).to have_text('$75,000,500.00')
    # expect(page).to have_text("2017")
    expect(page).to have_text('The award-winning cast')
    expect(page).to have_text('123 min')
    expect(page).to have_text('The ever-creative director')

  end

end
