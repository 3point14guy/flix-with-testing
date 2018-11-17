require "rails_helper"

describe "deleting a user" do
  it "will remove the user from the db and show updated users list" do
    user = User.create!(user_attributes)
    visit user_url(user)
    click_link "Delete Account"

    expect(current_path).to eq(root_path)
    expect(page).to have_text("Account deleted successfully.")

    visit users_url
    expect(page).not_to have_text(user.name)
  end
end
