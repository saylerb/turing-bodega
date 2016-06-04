require "rails_helper"

RSpec.feature "User Creation" do 
  scenario "a user can create a new account" do 

    visit new_user_path
    fill_in "Username", with: "brian"
    fill_in "Password", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Welcome, brian")

  end
end
