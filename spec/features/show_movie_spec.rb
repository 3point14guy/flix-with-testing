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

  it "shows flop if total_gross is less than $50M" do
    movie1 = Movie.create(movie_attributes(total_gross: 49000000))
    visit movie_url(movie1)

    expect(page).to have_text("Flop!")
  end

  it "displays total_gross if over $50M" do
    movie1 = Movie.create(movie_attributes(total_gross: 52000000))
    visit movie_url(movie1)

    expect(page).to have_text("$52,000,000.00")
  end
end
