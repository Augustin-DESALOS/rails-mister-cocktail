# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
ingredient = JSON.parse(user_serialized)

Ingredient.destroy_all

ingredient["drinks"].each do |i|
  Ingredient.create(name: i["strIngredient1"])
end

Cocktail.create(name:"mojito")
Cocktail.create(name:"Sex on the beach")
Cocktail.create(name:"Daïkiri")
Cocktail.create(name:"Cuba libre")
Cocktail.create(name:"Montana")
Cocktail.create(name:"Sprite")
