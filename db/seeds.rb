# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new({ name: "Cocktail Shaker", price: 15, description: "Shakers used for mixing cocktails.", inventory: 1, supply_id: 3 })
product.save

product = Product.new({ name: "Whisky Glass", price: 20, description: "Glass used for sipping whisky.", inventory: 1, supply_id: 1 })
product.save

product = Product.new({ name: "Decanter", price: 100, description: "Used to store and display a beautiful whisky.", inventory: 1, supply_id: 1 })
product.save

product = Product.new({ name: "Ice bucket", price: 50, description: "Used for keeping ice available for parties but also frozen. Also, a classy way to display your frozen water blocks.", inventory: 1, supply_id: 2 })
product.save

product = Product.new({ name: "Collins Glass", price: 20, description: "Tall glass meant for mixed cocktails.", inventory: 1, supply_id: 2 })
product.save

supplier = Supplier.new({ name: "bar co", email: "barco@test.com", phone_number: "888-919-0000" })
supplier.save

supplier = Supplier.new({ name: "bar equipment inc", email: "bareq@test.com", phone_number: "888-919-0001" })
supplier.save

supplier = Supplier.new({ name: "mixer org", email: "mixer@test.com", phone_number: "888-919-0002" })
supplier.save

image = Image.new({ url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxnBupcbvgyGjiW-yUrB-LvVanp3FbZMWHVg&usqp=CAU", product_id: 1 })
image.save

image = Image.new({ url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDIYk4FTI8XjtlYTngSgCnakOZpQL7mnn52A&usqp=CAU", product_id: 2 })
image.save

image = Image.new({ url: "https://www.waterford.com/-/media/products/2020/06/19/09/51/resource_waterfordamericas_40013792.ashx?q=40&iw=676&ih=676&crop=1", product_id: 3 })
image.save

image = Image.new({ url: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQc6gygm0aLfBmxdxCNV4D-3O4x0MAWwvgE01LW1TGdYfvRj6GaHGMeP2qJPbtr3tMouOhDis6cY4ndVx1gs1cv2i5Gs8uqIg&usqp=CAc", product_id: 4 })
image.save

image = Image.new({ url: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS09Gjw0LuMxHSheCFkgCA_ls6F_m2vMBfc6o_QtEzxXplrPKh3rpmLjT32hWrmUcpnmgD4-7OKgAxFs1f90MYFJ48iLgk4W294CyRCYerPb4_hvexwbgIcXA&usqp=CAc", product_id: 5 })
image.save

User.create!(name: "Joey", email: "joey@test.com", password: "password")
User.create!(name: "Jane", email: "jane@test.com", password: "password")

Category.create!(name: "Glass")
Category.create!(name: "Decoration")
Category.create!(name: "Storage")
Category.create!(name: "Bar Tool")

CategoryProduct.create!(product_id: 1, category_id: 4)
CategoryProduct.create!(product_id: 2, category_id: 1)
CategoryProduct.create!(product_id: 2, category_id: 2)
CategoryProduct.create!(product_id: 3, category_id: 3)
CategoryProduct.create!(product_id: 3, category_id: 2)
CategoryProduct.create!(product_id: 4, category_id: 2)
CategoryProduct.create!(product_id: 4, category_id: 3)
CategoryProduct.create!(product_id: 5, category_id: 1)
