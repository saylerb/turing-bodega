require "rails_helper"

RSpec.feature "User logs in" do 
  scenario "with valid credentials" do 
    login_user

    within(find_by_id("welcome")) do 
      expect(page).to have_content("Welcome, brian!")
    end
  end

  scenario "with invalid credentials" do 
    visit login_path
    fill_in "Username", with: "brian"
    fill_in "Password", with: "password"
    click_button "Login"

    within("div#flash") do 
        expect(page).to have_content("Invalid. Try Again.")
    end

    expect(current_path).to eq(login_path)

    within("div#content") do
      expect(page).to have_content("Login")
    end

  end

  scenario "with incorrect password" do
    user = User.create(username: "brian", password: "password")
    visit login_path
    fill_in "Username", with: "brian"
    fill_in "Password", with: "incorrectpassword"
    click_button "Login"

    # within("div#flash") do 
    #   expect(page).to have_content("Invalid. Try Again.")
    # end

    within("div#content") do
      expect(page).to have_content("Login")
    end
  end

  scenario "with valid credentials and can logout" do
    login_user

    within(find_by_id("welcome")) do 
      expect(page).to have_content("Welcome, brian!")
    end

    click_link "Logout"

    within("div#flash") do 
      expect(page).to have_content("Goodbye!")
    end

    within("div#content") do
      expect(page).to have_content("Login")
    end
  end

  def login_user
    user = User.create(username: "brian", password: "password")

    visit login_path
    fill_in "Username", with: "brian"
    fill_in "Password", with: "password"
    click_button "Login"
  end
  
end
