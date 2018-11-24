class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: /\A\S+@\S+\z/
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :username, uniqueness: true

  def self.authenticate(login, password)
    if !login.include?("@")
      user = User.find_by(username: login)
    else
      user = User.find_by(email: login)
    end
  # # or could have done like this:
  # def self.authenticate(email_or_username, password)
  #   user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end
end
