require 'rails_helper'

describe "Viewing the show page will" do
  it "show details for a single movie" do
    movie1 = Movie.create(movie_attributes)

    visit movie_url(movie1)

    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description)
    expect(page).to have_text("$318,412,101.00")
    expect(page).to have_text(movie1.released_on)
  end
end
