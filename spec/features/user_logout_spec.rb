require "rails_helper"

RSpec.feature "User Logout" do 
  scenario "logged in user can lo out" do 

    user = User.create(username: "brian", password: "password")

    visit login_path

    fill_in "Username", with: "brian"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(page).to have_selector("#welcome")
    within("#welcome") do 
      expect(page).to have_content("Welcome, brian!")
    end

    click_link "Logout"

    expect(page).not_to have_selector("#welcome")
  end
end
