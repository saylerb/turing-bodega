require "rails_helper"

RSpec.feature "User Login" do 
  scenario "a registered user can login" do 

    user = User.create(username: "brian", password: "password")

    visit login_path

    fill_in "Username", with: "brian"
    fill_in "Password", with: "password"
    click_button "Login"

    within(find_by_id("welcome")) do 
      expect(page).to have_content("Welcome, brian!")
    end

  end
end
