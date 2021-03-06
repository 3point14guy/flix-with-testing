class Movie < ApplicationRecord
  # this tells rails to expect a movie_id foreign key column in the table wrapped by the Review model
  has_many :reviews, dependent: :destroy
  # from paperclip and imagemagick
  has_attached_file :image, styles: {
  large: "150X222>",
  small: "90x133>",
  thumb: "50x74>"
}

  validates :title, :released_on, :duration, presence: true
  validates :description, length: {minimum: 25}
  validates :total_gross, numericality: {greater_than_or_equal_to: 0}
  # # this one was for local file upload
  # validates :image_file_name, allow_blank: true, format: {
  #   with: /\w+\.(gif|jpg|png)\z/i,
  #   message: "must reference a GIF, JPG, or PNG image"
  # # this one is for use with paperclip and aws-s3
  validates_attachment :image,
    :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/png"] },
    :file_size => { :less_than => 1.megabyte }

  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: {in: RATINGS}


  def flop?
    #self is implicit and not really needed inside
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

  def average_stars
    reviews.average(:stars)
  end

  def recent_reviews
    reviews.order('created_at desc').limit(2)
  end


end
