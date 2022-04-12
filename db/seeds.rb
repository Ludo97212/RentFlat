# require "faker"

# CITY = ["Paris", "Marseille", "Lyon", "Nice", "Bordeaux", "Lens", "Montpellier",
#         "Strasbourg", "Toulouse", "Lille", "Saint -Etienne", "Metz", "Toulon",
#         "Caen", "Nantes"]
CITY = ["Paris", "Marseille", "Lyon", "Nice", "Bordeaux", "Montpellier",
        "Toulouse", "Lille"]
ADDRESS = ["#{(27..150).to_a.sample}, place Rémy Barbe", "#{(27..150).to_a.sample}, rue Charlotte Torres", "#{(27..150).to_a.sample}, impasse Bouvier", "#{(27..150).to_a.sample}, impasse Martineau","#{(27..150).to_a.sample}, avenue Vallee", "#{(27..150).to_a.sample}, boulevard de Poirier", "#{(27..150).to_a.sample}, rue de Brunel"]
FLAT_GENRE = ["Studio", "Appartement", "Maisonnette", "Loft", "T1", "T2", "T3", "T4", "T5"]
FLAT_NAME = ["Le Gîte du Cèdre Bleu","La Famille Réunie","Au Sommet du Monde","Gîte à la Campagne","Chambre Sérénité","Chambre Plein Océan","Le Gîte Oublié","Le Rivage Bleu","Villa Éole","Duo des Jardins","Le Domaine Coloré","Les Terrasses Ensoleillées","La Robe Rose","Le Patio Bleu","Les Châteaux Bleus","La Résidence Alizé","Espace Estival","Sensation Printemps","Villa Lumière"]

# puts "DESTROY BOOKINGS"
Booking.destroy_all

puts "DESTROY FLATS"
Flat.destroy_all

puts "DESTROY USERS"
User.destroy_all

puts "CREATE 2 USERS"
User.create!(email: "toto@gmail.com", password: "azerty")
User.create!(email: "bibi@gmail.com", password: "azerty")

puts "CREATE x FLATS"
  50.times do
    Flat.create!(name: FLAT_NAME.sample,
                area: (9...100).to_a.sample,
                description: "Sympathique studio soigneusement décoré et aménagé avec des meubles design haut de gamme neufs (table Habitat, tabourets Cinna etc.)
                  Belle lumière naturelle
                  Lit très confortable avec matelas épais
                  Wifi haut débit via fibre optique
                  Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides etc.)
                  Machine à laver disponible dans une dépendance.
                  Place de parking gratuite au sous-sol, sécurisé ouverture via une télécommande.
                  Rue à sens unique calme, verdure.
                  Le logement
                  Sympathique studio soigneusement décoré et aménagé avec des meubles design haut de gamme neufs (table Habitat, tabourets Cinna etc.)
                  Lit très confortable avec matelas épais de qualité.
                  Wifi haut débit via fibre optique.
                  Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides etc.)
                  Machine à laver disponible dans une dépendance.
                  Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  Rue à sens unique calme et avec de la verdure.
                  Immeuble résidentiel calme et bien entretenu.",
                daily_price: (20..90).to_a.sample,
                # address: "#{CITY.sample}, #{ADDRESS.sample}",
                address: "#{CITY.sample}",
                user_id: User.all.sample.id)
  end

puts "Finished"
