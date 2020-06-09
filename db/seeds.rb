# development wipe
if Rails.env.development?
  Product.destroy_all
  Certification.destroy_all
  License.destroy_all
  Offer.destroy_all
  Supplier.destroy_all
  User.destroy_all
end

# users seed
puts "#######################################################################"
puts "Generating test user"
User.create!(
    name: Faker::Name.name,
    email: "test@gmail.com",
    password: "123456",
    country: Faker::Address.country,
    user_type: "purchaser"
  )
puts "Test PURChASER account email: #{User.first.email}"

User.create!(
    name: Faker::Name.name,
    email: "test2@gmail.com",
    password: "123456",
    country: Faker::Address.country,
    user_type: "supplier"
  )
puts "Test SUPPLIER account email: #{User.last.email}"
Supplier.create!(
    name: Faker::Company.name,
    location: Faker::Address.city,
    industry: Faker::IndustrySegments.sector,
    delivery_terms: ["FOB", "EXW", "FAS", "FCA", "CFR", "CPT", "CIF", "CIP", "DES", "DAF", "DEQ", "DDP", "DDU"].sample,
    payment_terms: ["T/T", "L/C", "D/P", "Western Union", "Moneygram"].sample,
    nearest_port: "#{Faker::Address.city} Puerta",
    whitelisted: nil,
    established: Date.today - rand(200..10000),
    user: User.last
  )

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

  # Supplier generation
  supplier = Supplier.create!(
    name: Faker::Company.name,
    location: Faker::Address.city,
    industry: Faker::IndustrySegments.sector,
    delivery_terms: ["FOB", "EXW", "FAS", "FCA", "CFR", "CPT", "CIF", "CIP", "DES", "DAF", "DEQ", "DDP", "DDU"].sample,
    payment_terms: ["T/T", "L/C", "D/P", "Western Union", "Moneygram"].sample,
    nearest_port: "#{Faker::Address.city} Puerta",
    whitelisted: nil,
    established: Date.today - rand(200..10000),
    user: user
  )

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

Supplier.all.each { |s| License.create!(
  authority: "#{Faker::Space.galaxy} #{Faker::ElectricalComponents.active} Agency", 
  number: Faker::Alphanumeric.alphanumeric(number: 10), 
  supplier: s
  )}
puts "#{Supplier.all.count} Suppliers generated."
puts "#######################################################################"
puts "Creating products"

Supplier.all.each { |s| rand(1..4).times do Product.create!(
  name: Faker::Commerce.product_name,
  price: Faker::Commerce.price(range: 2..848.0, as_string: false),
  category: Faker::Company.industry,
  production_quantity: Faker::Number.number(digits: 6),
  minimum_order_quantity: rand(50..1000),
  supplier: s
)
end
}
puts "#{Product.all.count} Products generated."


puts "#######################################################################"
puts "Creating certifications"

4.times do
  certification = Certification.create!(
    number: rand(23..5746), 
    validity: Faker::Date.forward(days: 170),
    category:["Annual", "Permanent"].sample,
    listing_number: Faker::Number.leading_zero_number(digits: 10),
    code: Faker::Alphanumeric.alphanumeric(number: 5),
    authority: Faker::IndustrySegments.sub_sector
  )
end
puts "#{Certification.count} Certifications created…"

puts "#######################################################################"
puts "Seeding Product Offers join table"
Product.all.each { |p| p.offers << Offer.all.sample }
puts "#######################################################################"

puts "#######################################################################"
puts "Seeding Product Certifications join table"
Product.all.each { |p| p.certifications << Certification.all.sample }
puts "#######################################################################"
