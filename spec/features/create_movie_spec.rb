require 'rails_helper'

describe "creating a new movie" do
  it "generates a form, adds the movie to the db and then shows what was added" do
    visit movies_url
    click_link "Add A Movie"

    expect(current_path).to eq(new_movie_path)

    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "People doing stuff and recorded on film"
    select "PG-13", from: "movie_rating"
    fill_in "Total gross", with: "75000500"
    # select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    # fill_in "Released on", with: (Time.now.year - 1).to_s
    fill_in "Released on", with: "2014/01/05"
    fill_in "Cast", with: "The award-winning cast"
    fill_in "Director", with: "The ever-creative director"
    fill_in "Duration", with: "123 min"
    attach_file "Image file name", "app/assets/images/moviemarathon.png"

    click_button "Create Movie"

    expect(current_path).to eq(movie_path(Movie.last))
    expect(page).to have_text('Movie successfully created!')
    expect(page).to have_text('New Movie Title')
    expect(page).to have_text('People doing stuff')
    expect(page).to have_text('G')
    expect(page).to have_text('$75,000,500.00')
    expect(page).to have_text("2014")
    expect(page).to have_text('The award-winning cast')
    expect(page).to have_text('123 min')
    expect(page).to have_text('The ever-creative director')
  end

  it "does not save the movie if it's invalid" do
    visit new_movie_url

    expect {
      click_button 'Create Movie'
    }.not_to change(Movie, :count)

    # expect(current_path).to eq(new_movie_path)
    expect(page).to have_text('errors')
  end
end
