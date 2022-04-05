# require "faker"

# CITY = ["Paris", "Marseille", "Lyon", "Nice", "Bordeaux", "Lens", "Montpellier",
#         "Strasbourg", "Madrid", "Barcelone", "Seville", "Rome", "Berlin", "Munich",
#         "Porto", "Milan", "Londres"]
# ADDRESS = ["#{(27..150).to_a.sample}, place Rémy Barbe", "#{(27..150).to_a.sample}, rue Charlotte Torres", "#{(27..150).to_a.sample}, impasse Bouvier", "#{(27..150).to_a.sample}, impasse Martineau","#{(27..150).to_a.sample}, avenue Vallee", "#{(27..150).to_a.sample}, boulevard de Poirier", "#{(27..150).to_a.sample}, rue de Brunel"]

# # puts "DESTROY BOOKINGS"
# # Booking.destroy_all

# puts "DESTROY FLATS"
# Flat.destroy_all

# puts "DESTROY USERS"
# User.destroy_all

# puts "CREATE 2 USERS"
# User.create!(email: "toto@gmail.com", password: "azerty")
# User.create!(email: "bibi@gmail.com", password: "azerty")

# puts "CREATE x FLATS"
#   20.times do
#     Flat.create!(name: Faker::App.name,
#                 area: (25...120).to_a.sample,
#                 description: Faker::Lorem.sentence(word_count: 15),
#                 daily_price: (20..90).to_a.sample,
#                 # address: "#{CITY.sample}, #{ADDRESS.sample}",
#                 address: "#{CITY.sample}",
#                 user_id: User.all.sample.id)
#   end

# puts "Finished"

flats = Flat.all
flats.each do |flat|
  flat.description = "Le Studio est un appartement de type open space de 35 m2 avec un plafond situé à 2.80 mètres du sol. Il se trouve au 1er étage d’un immeuble du 18ème siècle sans ascenseur. L’immeuble est équipé d’un code porte. Il dispose de deux couchages, 1 lit de 160 cm et un canapé lit de 120, pouvant accueillir ensemble 3 personnes au total. L’appartement est entièrement équipé en termes de draps de lit, de couvertures, et d’oreillers.Le studio est localisé rue Saint Martin dans le 4 éme arrondissement. Son emplacement le place a proximité immédiate de toutes les attractions du centre de Paris. Vous trouverez également à vos pieds l’ensemble des moyens de transport possible à Paris, RER, Métro, bus. L’appartement se trouve à 2 minutes à pied de la station les « halles », ce qui vous permettra de le rejoindre directement en transport en commun à partir de tous les aéroports de la capitale.Il dispose à proximité de tous les commerces dont vous aurez besoin pour effectuer vos courses ou un nombre infini de restaurants et de café.En termes d’équipement le Studio dispose d’un téléviseur avec les chaines du câble. L’internet sans fil est également à votre disposition.La cuisine est une cuisine ouverte. Cette pièce est équipée avec, un réfrigérateur, un congélateur, deux plaques, une hotte aspirante, un micro ondes, une cafetière, une bouilloire, un toaster, et tous les ustensiles de cuisine nécessaire. Intégrer à la cuisine vous disposerez également d’une machine à laver le linge disposant d’une fonction séchante.La salle de bain en marbre de 4m2 est équipée d’un lavabo, d’une douche, de wc, d’un meuble de salle de bain, de serviettes de bain et d’un sèche cheveux."
  flat.save!
end
