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
    expect(page).to have_link(user.name)
    expect(page).not_to have_link("Sign Up")
    expect(page).not_to have_link("Sign In")
  end

  it "does not allow user with incorrect logins to login" do
    user = User.create!(user_attributes)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "@test.com"
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(page).to have_text("Invalid email/password combination.")
    expect(page).not_to have_link(user.name)
    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Sign In")
  end

  it "redirects to the intended page" do
    user = User.create!(user_attributes)

    visit users_url

    expect(current_path).to eq(new_session_path)

    sign_in(user)

    expect(current_path).to eq(users_path)
  end

end
