class Movie < ApplicationRecord

  validates :title, :released_on, :duration, presence: true
  validates :description, length: {minimum: 25}
  validates :total_gross, numericality: {greater_than_or_equal_to: 0}
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: {in: RATINGS}

  def flop?
    self.total_gross < 50000000
  end

  def self.released
    where("released_on < ?", Time.now).order(released_on: :desc)
  end

  def self.hits
    where("total_gross > 300000000").order("total_gross asc")
  end

  def self.flops
    where("total_gross < 50000000").order("total_gross")
  end

  def self.recent
    order("created_at desc").limit(3)
  end
end
