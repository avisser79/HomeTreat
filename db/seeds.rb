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
Availability.delete_all
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
subcategories_hair = ["Hair colouring", "Haircut", "Hair removal",  "Hair styling", "Hair trimming"]
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

urls = ["http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539041/wout_urs51l.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539043/sebastiaan_lklt4c.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539041/roos_wmezxx.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539040/pien_lbyojx.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539039/nora_po3bqv.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539039/noah_eqcmyu.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/mina_whq8xi.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/melle_ca6egj.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/maarten_jwht80.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/lisa_s6j2p3.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539038/janne_vl8vnm.jpg",
  "http://res.cloudinary.com/dkmxtdusq/image/upload/v1511539039/cato_kd3e0t.jpg",
  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?dpr=1&auto=format&fit=crop&w=376&h=251&q=60&cs=tinysrgb&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
  "https://static.bhphotovideo.com/explora/sites/default/files/styles/960/public/Lindsay_Adler_distracting%20background_0.jpg?itok=8NNZWwSi",
  "http://static3.businessinsider.com/image/569f7e43e6183ea4008baa5a-800-800/z6ypag0d.jpeg",
  "https://www.math.uconn.edu/wp-content/Portraits/FabriceBaudoin.jpg",
  "https://s3.amazonaws.com/resume.cdn/articles/authors/32_898341_RondaSuderShotsquare.jpg",
  "https://livingmaxwell.com/wp-content/uploads/2009/07/max-headshot.jpg",
  "https://www.google.nl/imgres?imgurl=https%3A%2F%2Fs3.amazonaws.com%2Ftypekit-production-public-assets%2Fdesigners%2Fprofile_images%2F000%2F000%2F860%2Foriginal%2Frobert-slimbach-unedited.jpg%3F1507329738&imgrefurl=https%3A%2F%2Ftypekit.com%2Ffonts%2Fadobe-garamond&docid=RsHoAX8tjwJf7M&tbnid=hcNGmNgEsK6q8M%3A&vet=10ahUKEwiImoHI2ubXAhVLKewKHbUGCGc4rAIQMwgLKAkwCQ..i&w=400&h=400&bih=699&biw=1275&q=regular%20person&ved=0ahUKEwiImoHI2ubXAhVLKewKHbUGCGc4rAIQMwgLKAkwCQ&iact=mrc&uact=8",
  "https://www.google.nl/imgres?imgurl=https%3A%2F%2Fs3.amazonaws.com%2Ftypekit-production-public-assets%2Fdesigners%2Fprofile_images%2F000%2F000%2F635%2Foriginal%2FKhajag_Apelian_square.jpg%3F1507307777&imgrefurl=https%3A%2F%2Ftypekit.com%2Ffonts%2Farek&docid=qL5KojQiDQDaPM&tbnid=bQ3LSmYwNy72WM%3A&vet=10ahUKEwiImoHI2ubXAhVLKewKHbUGCGc4rAIQMwhYKFUwVQ..i&w=400&h=400&bih=699&biw=1275&q=regular%20person&ved=0ahUKEwiImoHI2ubXAhVLKewKHbUGCGc4rAIQMwhYKFUwVQ&iact=mrc&uact=8",
  "http://thebeardedladyproject.com/wp-content/uploads/2014/09/IMG_3202.jpg"]
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
20.times.with_index do |index|
  user = User.new({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name })
  user.email = Faker::Internet.email
  user.password = 'password'
  user.password_confirmation = 'password'
  user.remote_photo_url = urls[index]
  user.save!
  puts "User #{index} - #{user.first_name} created"
end

bios = [
  "I'm young, friendly, and can apply different hair styles",
  "I have more than 10 years experience doing haircuts",
  "If you have curly hair, I am your specialist!",
  "I work mostly on Monday and Friday",
  "I not only do hair, but nails and make-up as well",
  "I have won several prices for styling hair",
  "I do offer training as well",
  "No hairstyle is too difficult for me",
  "After 10 haircuts you get one for free",
  "Specialized in children haircuts",
  "I do bridal hair styling as well"
]
locations = [
  "Amsterdam", "Amsterdam-North", "Amsterdam-Centre", "Amsterdam-South", "Amsterdam-West", "Amsterdam-East"
]
time = Time.now
days = (1..7).to_a
hours = [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
minutes = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 0]
subcategories = Subcategory.all
categories = Category.all

# specialist seed
puts 'upgrading all the users to specialists'
User.take(20).each do |user|
  specialist = Specialist.new({ bio: bios.sample, work_experience: 'Did it once, looked good'})
  specialist.user = user
  user.is_specialist = true
  user.save
  specialist.specialization = "Hair specialist"
  specialist.hourly_rate = (20..50).to_a.sample
  puts "adding treatments to #{specialist.full_name}"
  (1..10).to_a.sample.times do
    treatment = Treatment.new({ price: rand(5..30), duration: rand(5..60), segment: 'everyone' })
    treatment.specialist = specialist
    treatment.subcategory = hair.subcategories.sample
    treatment.description = treatment.subcategory.name + ' treatment'
    treatment.save
  end
  days.sample(days.sample).each do |day|
    5.times do
      times = [time.change(hour: hours.sample, min: minutes.sample), time.change(hour: hours.sample, min: minutes.sample)].sort
      availability = Availability.new({ start_time: times[0], end_time: times[1], date: day.days.from_now, location: locations.sample })
      availability.specialist = specialist
      availability.save
    end
  end
  specialist.save!
end

# adding rating to specialists
# puts 'adding ratings to users'
# Specialist.take(20).each do |specialist|
#     specialist.reviews << Review.create!(
#     content: ["It was really good", "just the best", "Finest specialist ever", "Would go again", "Personal touch ++"].sample,
#     rating: rand(3..5)
#     )
# end
