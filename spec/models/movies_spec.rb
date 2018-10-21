require 'rails_helper'

describe "A movie" do
  it "with a total gross of less than 50,000,000 is a flop" do
    movie = Movie.create(movie_attributes(total_gross: 49000000))

    expect(movie.flop?).to eq(true)
  end

  it "with a total gross of more than 50,000,000 is not a flop" do
    movie = Movie.create(movie_attributes(total_gross: 59000000))

    expect(movie.flop?).to eq(false)
  end
end
