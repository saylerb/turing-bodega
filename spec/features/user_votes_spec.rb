require "rails_helper"

RSpec.feature "User votes" do 

  # As a user

  user = User.create(username: "brian", password: "password")
  # When I visit a product page
  
  # I can click a vote button
  # I see that I've voted on that thing (flash msg)

  # When I return to product index, it shows the total votes for that product

  def create_product

  end

end
