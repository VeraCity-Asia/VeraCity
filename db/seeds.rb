# development wipe
if Rails.env.development?
  User.destroy_all
end

# users seed
puts "#######################################################################"
4.times do 
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    country: Faker::Ancient.primordial,
    user_type: Faker::Company.buzzword
  )
  puts "#{user.name} created…"
end
puts "#######################################################################"
