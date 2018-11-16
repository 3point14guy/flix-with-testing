require 'rails_helper'

describe "The list of users" do
  it "shows user's name and email" do
    user1 = User.create(user_attributes(name: "Bob"))
    user2 = User.create(user_attributes(email: "Bill@test.com"))

    visit users_url

    expect(page).to have_text("2 users")
    expect(page).to have_text(user1.name)
    expect(page).to have_text(user2.email)
  end
end
