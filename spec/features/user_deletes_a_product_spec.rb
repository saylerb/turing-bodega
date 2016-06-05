require "rails_helper"

RSpec.feature "Delete product" do 
  scenario "User visits product page and deletes that product" do

    # As a user
    # Given that a product exists in the database
    burrito_image_path = "http://img14.deviantart.net/a9b6/i/2008/229/f/2/breakfast_burrito_by_cb_smizzle.jpg"
    burrito = Product.create(name: "Breakfast Burrito", description: "Best burrito", image_path: burrito_image_path )

    beer_image_path = "http://france44.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/P/B/PBR_16_tall_boys_cans_4.gif"
    beer  = Product.create(name: "Pabst Blue Ribbon", description: "hipster's favorite beverage", image_path: beer_image_path )


    # When I visit the product index page
    visit products_path

    expect(current_path).to eq(products_path)
    # I should see links to all the products

    expect(page).to have_link("Breakfast Burrito", href: product_path(burrito))
    expect(page).to have_link("Pabst Blue Ribbon", href: product_path(beer))
    
    # When I visit a product's show page
    click_on "Breakfast Burrito"

    # And I click on "Delete"
    click_on "Delete"

    # Then I should be back on the product index page
    expect(current_path).to eq(products_path)

    # Then I should not see the product's name
    within("div#content") do
      expect(page).to_not have_content("Breakfast Burrito")
      expect(page).to have_content("Pabst Blue Ribbon")
    end

  end
end
