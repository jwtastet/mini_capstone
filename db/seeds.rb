# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new({ name: "Cocktail Shaker", price: 15, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxnBupcbvgyGjiW-yUrB-LvVanp3FbZMWHVg&usqp=CAU", description: "Shakers used for mixing cocktails." })
product.save

product = Product.new({ name: "Whisky Glass", price: 20, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDIYk4FTI8XjtlYTngSgCnakOZpQL7mnn52A&usqp=CAU", description: "Glass used for sipping whisky." })
product.save

product = Product.new({ name: "Decanter", price: 100, image_url: "https://www.waterford.com/-/media/products/2020/06/19/09/51/resource_waterfordamericas_40013792.ashx?q=40&iw=676&ih=676&crop=1", description: "Used to store and display a beautiful whisky." })
product.save

product = Product.new({ name: "Ice bucket", price: 50, image_url: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQc6gygm0aLfBmxdxCNV4D-3O4x0MAWwvgE01LW1TGdYfvRj6GaHGMeP2qJPbtr3tMouOhDis6cY4ndVx1gs1cv2i5Gs8uqIg&usqp=CAc", description: "Used for keeping ice available for parties but also frozen. Also, a classy way to display your frozen water blocks." })
product.save

product = Product.new({ name: "Collins Glass", price: 20, image_url: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS09Gjw0LuMxHSheCFkgCA_ls6F_m2vMBfc6o_QtEzxXplrPKh3rpmLjT32hWrmUcpnmgD4-7OKgAxFs1f90MYFJ48iLgk4W294CyRCYerPb4_hvexwbgIcXA&usqp=CAc", description: "Tall glass meant for mixed cocktails." })
product.save
