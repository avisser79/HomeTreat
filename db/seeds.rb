# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Order.delete_all
Appointment.delete_all
Treatment.delete_all
Specialist.delete_all
Subcategory.delete_all
Category.delete_all
User.delete_all

puts 'Creating categories...'
hair = Category.new({ name: "Hair" })
hair.save

skin = Category.new({ name: "Skin" })
skin.save

nails = Category.new({ name: "Nails" })
nails.save

body = Category.new({ name: "Body" })
body.save
puts 'Categories added!'

# subcategory seed
subcategories_hair = ["Hair colouring", "Hair cut", "Hair removal",  "Hair styling", "Hair trimming"]
subcategories_skin = ["Make-up", "Skin care"]
subcategories_nails = ["Manicure", "Pedicure"]
subcategories_body = ["Fitness", "Fysio", "Massage", "Other"]

puts 'creating hair subcategories'
subcategories_hair.each do |subcategory_hair|
  subcategory_a = Subcategory.new(name: subcategory_hair)
  subcategory_a.category = hair
  subcategory_a.save
end

puts 'creating skin subcategories'
subcategories_skin.each do |subcategory_skin|
  subcategory_a = Subcategory.new(name: subcategory_skin)
  subcategory_a.category = skin
  subcategory_a.save
end

puts 'creating nails subcategories'
subcategories_nails.each do |subcategory_nails|
  subcategory_a = Subcategory.new(name: subcategory_nails)
  subcategory_a.category = nails
  subcategory_a.save
end

puts 'creating body subcategories'
subcategories_body.each do |subcategory_body|
  subcategory_a = Subcategory.new(name: subcategory_body)
  subcategory_a.category = body
  subcategory_a.save
end

urls = ["http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539041/wout_urs51l.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539043/sebastiaan_lklt4c.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539041/roos_wmezxx.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539040/pien_lbyojx.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539039/nora_po3bqv.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539039/noah_eqcmyu.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/mina_whq8xi.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/melle_ca6egj.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/maarten_jwht80.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/lisa_s6j2p3.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/janne_vl8vnm.jpg", "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539039/cato_kd3e0t.jpg"]
url = "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511532826/srsa1duxqqiv7oceozoe.jpg"
# admin account
admin = User.new({ first_name: 'Hometreat', last_name: 'Admin', email: 'admin@hometreat.com' })
admin.remote_photo_url = url
admin.password = 'password'
admin.password_confirmation = 'password'
admin.admin = true
admin.save!

# user seed
puts 'creating users'
20.times do
  user = User.new({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name })
  user.email = Faker::Internet.email
  user.password = 'password'
  user.password_confirmation = 'password'
  user.remote_photo_url = urls.sample
  user.save!
end

bios = ["I'm young, friendly, and eager to earn a little on the side", "I'm selfish and like bold man, but Make-up is my true passion", "If you can do my hair I'll work for free", "My dog is hairy and ugly, so I'm fine with any hairstyle", "Beware, I like to listen to heavy metal during my work"]
subcategories = Subcategory.all
categories = Category.all

# specialist seed
puts 'upgrading half the users to specialists'
User.take(10).each do |user|
  specialist = Specialist.new({ bio: bios.sample, work_experience: 'Did it once, looked good'})
  specialist.user = user
  user.is_specialist = true
  user.save
  specialist.specialization = "#{categories.sample.name} specialist"
  specialist.hourly_rate = (20..50).to_a.sample
  puts "adding treatments to #{specialist.full_name}"
  (1..10).to_a.sample.times do
    treatment = Treatment.new({ price: rand(5..30), duration: rand(5..60), segment: 'everyone' })
    treatment.specialist = specialist
    treatment.subcategory = subcategories.sample
    treatment.description = treatment.subcategory.name + ' treatment'
    treatment.save
  end
  specialist.save!
end

# review_titles = ["nice", "perfect", "loved it", "superb", "smells funny", "treated me real good"]
# clients = Client.all
# 10.times do
#   specialist = Specialist.new({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, bio: bios.sample, rating: (0..5).to_a.sample })
#   specialist.email = Faker::Internet.email
#   specialist.password = 'password'
#   specialist.password_confirmation = 'password'
#   # treatment seed
#   (1..10).to_a.sample.times do
#     treatment = Treatment.new({ description: Faker::Dessert.variety, price: rand(5..30), duration: rand(5..60), segment: 'everyone' })
#     treatment.specialist = specialist
#     treatment.subcategory = subcategories.sample
#     treatment.save
#   end
#   # review seed
#   (1..10).to_a.sample.times do
#     review = Review.new({ title: review_titles.sample, content: Faker::MostInterestingManInTheWorld.quote, rating: rand(0..5) })
#     review.specialist = specialist
#     review.client = clients.sample
#     review.save!
#   end
#   specialist.save!
# end
