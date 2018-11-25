require 'rails_helper'

describe "Signing out" do
  it "logs user out" do
    user = User.create!(user_attributes)
    sign_in(user)

    click_link "Sign Out"

    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Sign In")
    expect(page).not_to have_link(user.name)
  end
end
