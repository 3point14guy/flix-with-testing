require 'rails_helper'

describe "A user's account page" do
  it "will show user's name and email" do
    user = User.create(user_attributes)

    sign_in(user)
    visit user_url(user)

    expect(page).to have_text(user.name)
    expect(page).to have_text(user.email)
  end

end
