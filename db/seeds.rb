# development wipe
if Rails.env.development?
  Certification.destroy_all
  License.destroy_all
  Offer.destroy_all
  Supplier.destroy_all
  User.destroy_all
end

# users seed
puts "#######################################################################"
4.times do 
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    country: Faker::Address.country,
    user_type: Faker::Company.buzzword
  )
  puts "#{user.name} created…"
  5.times do
    supplier = Supplier.create!(
      name: Faker::Company.name,
      location: Faker::Address.city,
      user: User.all.sample
    )
  end
  rand(1..3).times do
    offer = Offer.create!(
      amount: rand(100..320),
      destination:Faker::Address.city,
      price: rand(3..99),
      payment:["Visa", "MasterCard", "Invoice", "Wire Transfer"].sample,
      approved_date: Faker::Date.forward(days: 23),
      approved: nil,
      supplier: Supplier.all.sample,
      user: User.all.sample
    )
  end
end
puts "#######################################################################"
puts "Generating licenses…"
Supplier.all.each { |s| License.create!(authority: Faker::IndustrySegments.sector, number: Faker::Alphanumeric.alphanumeric(number: 10), supplier: s) }
puts "#{Supplier.all.count} generated."
puts "#######################################################################"
puts "Creating certifications"
4.times do
  certification = Certification.create!(
    number: Faker::Alphanumeric.alphanumeric, 
    validity: Faker::Date.forward(days: 170),
    type:["Annual", "Permanent"].sample,
    listing_number: Faker::Number.leading_zero_number(digits: 10),
    code: rand(34..674),
    authority: Faker::IndustrySegments.sub_sector
  )
  puts "#{certification.number} created…"
end
puts "#######################################################################"
