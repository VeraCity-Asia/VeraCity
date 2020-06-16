# development wipe
if Rails.env.development?
  Cecv.destroy_all
  Message.destroy_all
  ProductOffer.destroy_all
  Product.destroy_all
  Certification.destroy_all
  License.destroy_all
  Offer.destroy_all
  Supplier.destroy_all
  User.destroy_all
end

# variables
file_path = "db/repository/registration.csv"

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

cities = ["Beijing", "Chongqing", "Shanghai", "Tianjin", "Anqing", "Bengbu", "Bozhou"]

User.create!(
  name: Faker::Name.name,
  email: "test2@gmail.com",
  password: "123456",
  country: Faker::Address.country,
  user_type: "supplier"
)
puts "Test SUPPLIER account email: #{User.last.email}"
Supplier.first.update!(
  name: Faker::Company.name,
  location: cities.sample,
  industry: "Medical Supplies",
  delivery_terms: ["FOB", "EXW", "FAS", "FCA", "CFR", "CPT", "CIF", "CIP", "DES", "DAF", "DEQ", "DDP", "DDU"].sample,
  payment_terms: ["T/T", "L/C", "D/P", "Western Union", "Moneygram"].sample,
  nearest_port: "Shanghai Port",
  whitelisted: nil,
  established: Date.today - rand(200..10000),
  user: User.last
)

puts "#######################################################################"
2.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    country: "China",
    user_type: :supplier
  )
  puts "#{user.name} created…"

  # Supplier generation
  supplier = Supplier.create!(
    name: Faker::Company.name,
    location: cities.sample,
    industry: "Medical Supplies",
    delivery_terms: ["FOB", "EXW", "FAS", "FCA", "CFR", "CPT", "CIF", "CIP", "DES", "DAF", "DEQ", "DDP", "DDU"].sample,
    payment_terms: ["T/T", "L/C", "D/P", "Western Union", "Moneygram"].sample,
    nearest_port: "#{Faker::Address.city} Puerta",
    whitelisted: nil,
    established: Date.today - rand(200..10000),
    user: user
  )
end

puts "#######################################################################"
puts "Generating licenses…"

Supplier.all.each { |s| License.create!(

    authority: "China Official Government Licensing Agency (COGLA)",
    number: Faker::Alphanumeric.alphanumeric(number: 10),
    start_date: Date.today - 400,
    expired_date: Faker::Date.forward(days: 170),
    supplier: s
)}

puts "#{Supplier.all.count} Suppliers generated."
puts "#######################################################################"
puts "Creating products"

masks = ["Reusable Cotton Face Mask", "Reusable Face Covering", "Disposable 3 Layer Face Mask with Comfortable Earloop"]
thermometers = ["Thermometer for Adults and Kids, Fast and Accurate, C/F Switchable", "Non-Contact Infrared Thermometer", "Non-Contact Digital Laser Infrared Thermometer Temperature Gun"]
bandages = ["Maximum Hold Waterproof Bandages", "Medical Gauze Stretch Bandage Roll", "Premium Brand Adhesive Bandage Pads"]
category = ["Mask","Thermometer","Bandage"]

Supplier.all.each do |s| 
  m = Product.create!(
      name: masks.sample,
      price: Faker::Commerce.price(range: 2..48.0, as_string: false),
      category: category[0],
      production_quantity: Faker::Number.number(digits: 6),
      minimum_order_quantity: [100,200,300].sample,
      supplier: s
    )
  t = Product.create!(
      name: thermometers.sample,
      price: Faker::Commerce.price(range: 2..48.0, as_string: false),
      category: category[1],
      production_quantity: Faker::Number.number(digits: 6),
      minimum_order_quantity: [100,200,300].sample,
      supplier: s
    )
  b = Product.create!(
      name: bandages.sample,
      price: Faker::Commerce.price(range: 2..48.0, as_string: false),
      category: category[2],
      production_quantity: Faker::Number.number(digits: 6),
      minimum_order_quantity: [100,200,300].sample,
      supplier: s
    )
    # p.photos.attach(Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports', number: nil, text: 'Dummy-text'))
    # p.save!
end

puts "#{Product.all.count} Products generated."

puts "#######################################################################"
puts "Creating certifications"

2.times do
  certification = Certification.create!(
    number: rand(23..5746),
    category: "FDA",
    listing_number: Faker::Number.leading_zero_number(digits: 10),
    code: Faker::Alphanumeric.alphanumeric(number: 5),
    authority: "FDA",
    start_date: Date.today - 200,
    expired_date: Faker::Date.forward(days: 170)
  )
end
puts "#{Certification.count} Certifications created…"

puts "#######################################################################"
puts "Seeding Product Certifications join table"
Product.all.each { |p| p.certifications << Certification.all.sample }
puts "#######################################################################"

puts "#######################################################################"
puts "Seeding messages"
Product.all.each do |p|
  User.where(user_type: :purchaser).each do |u|
    Message.create!(
      product_id: p.id,
      sender_id: u.id,
      receiver_id: p.supplier.user_id,
      title: "Message about #{p.name}",
      content: "Hello #{p.supplier.user.name}, I am #{u.name}"
    )
    Message.create!(
      product_id: p.id,
      sender_id: p.supplier.user_id,
      receiver_id: u.id,
      title: "Reply regarding #{p.name}",
      content: "Thank you for your interest #{u.name}, sincerely—#{p.supplier.user.name}"
    )
  end
end
puts "#######################################################################"

puts "#######################################################################"
# seed the FDA supplier database
puts "Seeding FDA Supplier Database"
Import::FdaRegistration.call(file_path)
puts "#######################################################################"