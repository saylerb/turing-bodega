require "rails_helper"

RSpec.feature "User votes" do 
  scenario "on a product that exists" do

    # As a user
    product = create_product

    user = User.create(username: "brian", password: "password")
    # When I visit a product page
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit product_path(product)
    
    # I can click a vote button
    click_link "Vote Up"
    # I see a flash msg that I've voted on that thing (flash msg)

    within "div#flash" do
      expect(page).to have_content("Successfully Voted for '#{product.name}'")
    end

    # When I return to product index, it shows the total votes for that product

    visit products_path

    within "div#content" do
      expect(page).to have_content("Sparkling Water")
      expect(page).to have_content("Total Votes: 1")
    end
    

    
  end

  def create_product
    data = { name: "Sparkling Water", 
             description: "All natural bubbly water",
             image_path: "http://www.staples-3p.com/s7/is/image/Staples/s0896341_sc7?$splssku$" }
    Product.create(data)
  end

end
