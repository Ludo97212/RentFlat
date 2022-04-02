require "faker"

CITY = ["Paris", "Marseille", "Lyon", "Nice", "Bordeaux", "Lens", "Montpellier",
        "Strasbourg", "Madrid", "Barcelone", "Seville", "Rome", "Berlin", "Munich",
        "Porto", "Milan", "Londres"]
ADDRESS = ["#{(27..150).to_a.sample}, place Rémy Barbe", "#{(27..150).to_a.sample}, rue Charlotte Torres", "#{(27..150).to_a.sample}, impasse Bouvier", "#{(27..150).to_a.sample}, impasse Martineau","#{(27..150).to_a.sample}, avenue Vallee", "#{(27..150).to_a.sample}, boulevard de Poirier", "#{(27..150).to_a.sample}, rue de Brunel"]

# puts "DESTROY BOOKINGS"
# Booking.destroy_all

puts "DESTROY FLATS"
Flat.destroy_all

puts "DESTROY USERS"
User.destroy_all

puts "CREATE 2 USERS"
User.create!(email: "toto@gmail.com", password: "azerty")
User.create!(email: "bibi@gmail.com", password: "azerty")

puts "CREATE x FLATS"
  20.times do
    Flat.create!(name: Faker::App.name,
                area: (25...120).to_a.sample,
                description: Faker::Lorem.sentence(word_count: 15),
                daily_price: (20..90).to_a.sample,
                # address: "#{CITY.sample}, #{ADDRESS.sample}",
                address: "#{CITY.sample}",
                user_id: User.all.sample.id)
  end

puts "Finished"
