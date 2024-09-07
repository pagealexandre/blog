# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Article.create(title: "Should you create an app with Vue.js?", body: "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
								 lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
						 		 lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
Article.create(title: "Do you love cat ?", body: "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
								 lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
						 		 lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
Article.create(title: "Which tech is more trendy at the moment?", body: "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
								 lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
						 		 lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
Article.create(title: "How to be more efficient in your day to day?", body: "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
								 lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
						 		 lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")