require "rails_helper"

RSpec.feature "User creates a product" do
  scenario "User sees product index page and adds product" do 
    # As a User
    product_image_path = "http://img14.deviantart.net/a9b6/i/2008/229/f/2/breakfast_burrito_by_cb_smizzle.jpg"
    # When I visit the products index page
    visit products_path
    # And click "New Product"
    click_on "New Product"
    expect(current_path).to eq(new_product_path)
    # And I fill in the product name
    fill_in "Product Name", with: "Breakfast Burrito"
    # And I fill in the prduct description
    fill_in "Description", with: "The best kind of burrito"
    # And I add a product image path
    fill_in "Image Path", with: product_image_path 
    # And I click "Create Product"
    click_on "Create Product"
    # I should see the product, description, and image path on the page for that specific product
    expect(current_path).to eq(product_path(Product.last.id))

    expect(page).to have_content("Breakfast Burrito")
    expect(page).to have_content("The best kind of burrito")
    expect(page).to have_css("img[src=\"#{product_image_path}\"]")
  end
end
