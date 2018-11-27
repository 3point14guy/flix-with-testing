require "rails_helper"

describe "Editing a user" do
  it "displays a form, saves the info to the db, and updates show view" do
    user = User.create!(user_attributes)

    sign_in(user)
    visit user_url(user)
    click_link "Edit Account"

    expect(current_path).to eq(edit_user_path(user))
    expect(find_field('Name').value).to eq(user.name)

    fill_in "Name", with: "JuJu Bee"
    click_button "Update Account"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_text("JuJu Bee")
    expect(page).to have_text("Account updated successfully")
  end

  it "does not update if it's invlaid" do
    user = User.create!(user_attributes)

    sign_in(user)
    visit edit_user_url(user)
    fill_in "Name", with: " "
    click_button "Update Account"

    expect(page).to have_text("error")
  end
end
