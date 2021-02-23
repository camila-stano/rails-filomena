# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts '-----------------------------'
puts 'Cleaning up database...'
puts '-----------------------------'

User.destroy_all
Product.destroy_all

puts '-----------------------------'
puts 'Database is clear!'
puts '-----------------------------'
puts 'Creating User!'
puts '-----------------------------'


category = %w[casual party street]
type = %w[shorts tshirt dress]
size = %w[PP P M G GG XGG 38 40 42 44 46 48 50 52 54 56 58 60]

10.times do 
  user = User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_name,
    cpf: "#{rand(10..99)}.#{rand(001..999)}.#{rand(001..999)}-#{rand(1..9)}",
    bday: Faker::Date.birthday(min_age: 18, max_age: 100),
    password: "123456789ABC"
  )
  puts "The user #{user.id} created"
  puts '-----------------------------'
  puts 'Uploading some clotes...'
  puts '-----------------------------'



  3.times do 
    product = Product.create!(
      name: Faker::Color.color_name,
      buyable: [true, false].sample,
      exchangeable: [true, false].sample,
      price: (rand(5.00..100.00).floor(2) if :buyable == true),
      category: category.sample,
      product_type: type.sample,
      size: size.sample,
      avaible: true,
      description: Faker::Lorem.sentence(word_count: 10),
      user_id: user.id
    )
    puts "The #{product.name}, with #{product.id} of #{user.id} created"
  end
end








# quantities = [
#   '3 spoons', '150ml', '100ml', '50ml', '2 leaves',
#   '2 spoons', 'a bit', '30ml', 'a splash', '80ml'
# ]

# drink_names = [
#   'Old Fashioned',
#   'Margarita',
#   'Cosmopolitan',
#   'Negroni',
#   'Moscow Mule',
#   'Martini',
#   'Mojito',
#   'Whiskey Sour',
#   'French 75',
#   'Manhattan',
#   'Spritz',
#   'Gimlet',
#   'Sazerac',
#   'Pimm\'s Cup',
#   'Mimosa',
#   'Paloma',
#   'Sidecar',
#   'Mint Julep',
#   'Daiquiri',
#   'Dark & Stormy',
#   'Martinez'
# ]

# drinks_urls = [
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/old-fashioned-1592951230.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/margarita-1592951298.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cosmopolitan-1592951320.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/negroni-1592951342.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/moscow-mule-1592951361.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/martini-1592951711.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mojito-1592951385.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whiskey-sour-1592951408.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/french-75-1592951630.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/manhattan-1592951428.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/milano-spritzer-1593008325.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gimlet-1592951479.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/sazerac-1592951496.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pimms-cup-1592951518.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mimosa-1592951449.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/paloma-1592951544.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/sidecar-1592951563.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mint-julep-1592951594.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/daiquiri-1592951739.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dark-n-stormy-1592951763.jpg',
#   'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/martinez-1592951796.jpg'
# ]

# drink_names.each_with_index do |name, index|
#   cocktail = Cocktail.create!(name: name)
#   image = URI.open(drinks_urls[index])
#   cocktail.photo.attach(io: image, filename: cocktail.name, content_type: 'image/png')

#   puts "Mixing #{cocktail.name}..."
#   rand(3..6).times do
#     possible_ingredient = Ingredient.all.sample

#     possible_ingredient = Ingredient.all.sample while cocktail.ingredients.include?(possible_ingredient)

#     Dose.create!(
#       cocktail: cocktail,
#       ingredient: possible_ingredient,
#       description: quantities.sample
#     )
#   end
# end
# puts '-----------------------------'
# puts 'Writing some reviews...'
# puts '-----------------------------'

# 30.times do
#   review = Review.create!(
#     cocktail: Cocktail.all.sample,
#     content: Faker::ChuckNorris.fact,
#     rating: rand(1.0..5.0).round(1),
#     user: Faker::GreekPhilosophers.name
#   )
#   puts "#{review.user} has reviewed #{review.cocktail.name}"
# end

# 30.times do
#   review = Review.create!(
#     cocktail: Cocktail.all.sample,
#     content: Faker::Hipster.paragraph(sentence_count: 2),
#     rating: rand(1.0..5.0).round(1),
#     user: Faker::Ancient.god
#   )
#   puts "#{review.user} has reviewed #{review.cocktail.name}"
# end

# puts '-----------------------------'
# puts 'Seed successfully created!'
# puts '-----------------------------'
