class Movie < ApplicationRecord
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
