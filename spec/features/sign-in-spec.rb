require 'rails_helper'

describe "Signing in" do
  it "will prompt the user for email and password" do
    visit root_path
    click_link "Sign In"

    expect(current_path).to eq(signin_path)
    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end

  it "validates a user with correct logins" do
    user = User.create!(user_attributes)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_text("Welcome back #{user.name}!")
  end

  it "does not allow user with incorrect logins to login" do
    user = User.create!(user_attributes)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "@test.com"
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(page).to have_text("Invalid email/password combination.")
  end

end
