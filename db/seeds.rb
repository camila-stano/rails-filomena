# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

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


category = %w[ACESSÓRIOS BOHO CASUAL CLÁSSICO ESPORTIVA FESTA FORMAL JEANS SOCIAL]
type = %w[ACESSÓRIOS BERMUDA BLUSA CALÇA CAMISA CAMISETA CARDIGAN KIMONO JAQUETA MINI-SAIA PANTACOURT REGATA SAIA-LONGA SAIA-MIDI SAPATOS SHORTS T-SHIRT VESTIDO]
size = %w[PP P M G GG XGG 38 40 42 44 46 48 50 52 54 56 58 60 62 64]

5.times do 
  file = URI.open('https://source.unsplash.com/featured/?perfil')
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
  user.photo.attach(io: file, filename: 'photo.png', content_type: 'image/png')
  puts "The user #{user.id} created"
  puts '-----------------------------'
  puts "Uploading some products to #{user.first_name}..."
  puts '-----------------------------'

 

  3.times do 
    file = URI.open('https://source.unsplash.com/featured/?jeans,roupas')
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
    product.photos.attach(io: file, filename: 'photo.png', content_type: 'image/png')
    
    puts "The product #{product.id} of #{user.first_name} created"
  end
  puts "***********************************"
end
