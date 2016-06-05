# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


products = [ { name: "Sparkling Water", 
               description: "All natural bubbly water",
               image_path: "http://www.staples-3p.com/s7/is/image/Staples/s0896341_sc7?$splssku$" },
             { name: "Breakfast Burrito",
               description: "The best kind of burrito", 
               image_path: "http://img14.deviantart.net/a9b6/i/2008/229/f/2/breakfast_burrito_by_cb_smizzle.jpg" },
             { name: "Paper Towel Dispenser",
               description: "dont drip all the way down the hall, put this dispenser on the wall",
               image_path: "http://i.imgur.com/j44csVm.jpg" }
           ]


products.each do |data|
  product = Product.create(data)
  puts "#{product.name} Successfully created"
end
