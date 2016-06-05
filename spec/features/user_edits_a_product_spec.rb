require "rails_helper"

RSpec.feature "User edits an existing artist" do

  scenario "user navigates to edit page" do

    # As a user
    # Given that a product exists in the database
    product_image_path = "http://img14.deviantart.net/a9b6/i/2008/229/f/2/breakfast_burrito_by_cb_smizzle.jpg"

    product = Product.create(name: "Breakfast Burrito", description: "Best burrito", image_path: product_image_path )
 
    # When I visit that products's show page
    visit product_path(product)
    
    expect(current_path).to eq( product_path(product) )
    # And I click on "Edit"
    click_on "Edit"
    expect(current_path).to eq( edit_product_path(product) )

    # And I fill in a new name
    fill_in "Name", with: "Breakfast Burrito UPDATED NAME"
    
    # And I click on "Update Artist"
    click_on "Update Product"
   
    # Then I should see the artist's updated name
    within("div#content") do
      expect(current_path).to eq( product_path(product) )
      expect(page).to have_content("Breakfast Burrito UPDATED NAME")
   
    # Then I should see the existing image
    expect(page).to have_css("img[src=\"#{product_image_path}\"]")
    end
  end
end
