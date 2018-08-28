# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |x|
  Car.create(
    name: "Car #{x}",
    generation: "Gen #{x % 4 + 1}",
  )

  puts "Car ##{x} created.."
end

15.times do |x|
  Ticket.create(
    category: "Mechanical",
    note: "Test Ticket",
    location: ["Coconut Grove", "Coral Gables", "Hallandale Beach", "Key Biscayne", "Mainland", "Miami Lakes", "South Beach", "Other"].sample,
    car_id: rand(1..20),
    driveable: false,
    completed: false,

  )
end

15.times do |x|
  Ticket.create(
    category: "Mechanical",
    note: "Test Ticket",
    location: ["Coconut Grove", "Coral Gables", "Hallandale Beach", "Key Biscayne", "Mainland", "Miami Lakes", "South Beach", "Other"].sample,
    car_id: rand(1..20),
    driveable: true,
    completed: false,
  )
end



require "csv"

csv_text = File.read("/home/kp/Desktop/inv.csv")
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  Part.create(
    name: row["DESCRIPTION"],
    part_num: row["PART NUMBER"],
    quantity: 10,
  )

  p "Part entered.."
end

User.create!({:email => "kennethpauletti@gmail.com", :admin => true, :password => "password", :password_confirmation => "password"})
