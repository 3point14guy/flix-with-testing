require 'rails_helper'

describe "Creating a user" do
  it "displays a form, saves info to db, confirms entered data" do
    visit movies_url
    click_link "Sign Up"

    expect(current_path).to eq(signup_path)

    fill_in "Name", with: "some name"
    fill_in "Email", with: "some@name.com"
    fill_in "Password", with: "10digitpass"
    fill_in "Password Confirmation", with: "10digitpass"

    click_button "Create Account"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_text("some name")
    expect(page).to have_text("some@name.com")
    expect(page).to have_text("Thanks for signing up!")
    expect(page).to have_link("some name")
    expect(page).not_to have_link("Sign Up")
    expect(page).not_to have_link("Sign In")
  end

  it "does not save the user if it's invalid" do
    visit signup_url

    expect {
      click_button 'Create Account'
    }.not_to change(User, :count)

    expect(page).to have_text('error')
  end
end
