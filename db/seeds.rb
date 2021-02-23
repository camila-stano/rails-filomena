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

Product.destroy_all
User.destroy_all

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
  puts "Uploading some products to #{user.first_name}..."
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
      available: true,
      description: Faker::Lorem.sentence(word_count: 10),
      user_id: user.id
    )
    puts "The product #{product.id} of #{user.first_name} created"
  end
  puts "***********************************"
end
