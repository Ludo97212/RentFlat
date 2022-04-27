# require "faker"

# CITY = ["Paris", "Marseille", "Lyon", "Nice", "Bordeaux", "Lens", "Montpellier",
#         "Strasbourg", "Toulouse", "Lille", "Saint -Etienne", "Metz", "Toulon",
#         "Caen", "Nantes"]
CITY = ["Paris", "Marseille", "Lyon", "Nice", "Toulouse", "Lille", "Montpellier"]
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
                beds: (2..6).to_a.sample,
                area: (30...100).to_a.sample,
                description: "Sympathique logement soigneusement décoré et aménagé avec des meubles design haut de gamme neufs.
                  - Belle lumière naturelle
                  - Lit très confortable avec matelas épais de qualité.
                  - Wifi haut débit via fibre optique.
                  - Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides ...)
                  - Machine à laver disponible dans une dépendance.
                  - Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  - Rue à sens unique calme et avec de la verdure.
                  - Immeuble résidentiel calme et bien entretenu.
                  - Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  - Maecenas sagittis turpis eget rutrum fringilla.
                  - Quisque mollis sapien et dui maximus efficitur.
                  - Morbi congue neque non aliquam vehicula.
                  - Aliquam pretium lacus ut nunc interdum, sed eleifend sem posuere.

                  Suspendisse convallis eros sem. Phasellus ut odio rhoncus, ultricies justo aliquet, dictum elit. Vivamus tincidunt hendrerit felis, vel finibus sem consequat ut. Aliquam ut nulla convallis, pharetra massa a, egestas ligula.
                  Morbi condimentum odio in mi malesuada mollis. Ut et justo nisi. Praesent maximus at quam non consectetur. Morbi cursus et tortor ac convallis. Morbi sed congue lorem. Pellentesque lobortis ut arcu ac tincidunt. Suspendisse potenti. Ut a ante pulvinar, vulputate quam vel, ultricies orci.",
                daily_price: (20..90).to_a.sample,
                # address: "#{CITY.sample}, #{ADDRESS.sample}",
                address: "#{CITY.sample}",
                user_id: User.all.sample.id)
  end

  # -------------- APPARTS VITRINES ------------------------------------------ #
  puts "1st"
  flat1 = Flat.create!(name: "Le Bleuet",
          beds: 4,
          area: 80,
          description: "Sympathique logement soigneusement décoré et aménagé avec des meubles design haut de gamme neufs.
                  - Belle lumière naturelle
                  - Lit très confortable avec matelas épais de qualité.
                  - Wifi haut débit via fibre optique.
                  - Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides ...)
                  - Machine à laver disponible dans une dépendance.
                  - Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  - Rue à sens unique calme et avec de la verdure.
                  - Immeuble résidentiel calme et bien entretenu.
                  - Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  - Maecenas sagittis turpis eget rutrum fringilla.
                  - Quisque mollis sapien et dui maximus efficitur.
                  - Morbi congue neque non aliquam vehicula.
                  - Aliquam pretium lacus ut nunc interdum, sed eleifend sem posuere.

                  Suspendisse convallis eros sem. Phasellus ut odio rhoncus, ultricies justo aliquet, dictum elit. Vivamus tincidunt hendrerit felis, vel finibus sem consequat ut. Aliquam ut nulla convallis, pharetra massa a, egestas ligula.
                  Morbi condimentum odio in mi malesuada mollis. Ut et justo nisi. Praesent maximus at quam non consectetur. Morbi cursus et tortor ac convallis. Morbi sed congue lorem. Pellentesque lobortis ut arcu ac tincidunt. Suspendisse potenti. Ut a ante pulvinar, vulputate quam vel, ultricies orci.",
          daily_price: 42,
          address: "Toulouse",
          user_id: User.last.id)
  file = File.open('app/assets/images/FLATS/flat 1.png')
  flat1.photo.attach(io: file, filename: 'flat 1.png', content_type: 'image/png')
  # ---------------------------------------------------------------------------
  puts "2nd"
  flat2 = Flat.create!(name: "La longeoire sur Paris",
          beds: 2,
          area: 40,
          description: "Sympathique logement soigneusement décoré et aménagé avec des meubles design haut de gamme neufs.
                  - Belle lumière naturelle
                  - Lit très confortable avec matelas épais de qualité.
                  - Wifi haut débit via fibre optique.
                  - Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides ...)
                  - Machine à laver disponible dans une dépendance.
                  - Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  - Rue à sens unique calme et avec de la verdure.
                  - Immeuble résidentiel calme et bien entretenu.
                  - Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  - Maecenas sagittis turpis eget rutrum fringilla.
                  - Quisque mollis sapien et dui maximus efficitur.
                  - Morbi congue neque non aliquam vehicula.
                  - Aliquam pretium lacus ut nunc interdum, sed eleifend sem posuere.

                  Suspendisse convallis eros sem. Phasellus ut odio rhoncus, ultricies justo aliquet, dictum elit. Vivamus tincidunt hendrerit felis, vel finibus sem consequat ut. Aliquam ut nulla convallis, pharetra massa a, egestas ligula.
                  Morbi condimentum odio in mi malesuada mollis. Ut et justo nisi. Praesent maximus at quam non consectetur. Morbi cursus et tortor ac convallis. Morbi sed congue lorem. Pellentesque lobortis ut arcu ac tincidunt. Suspendisse potenti. Ut a ante pulvinar, vulputate quam vel, ultricies orci.",
          daily_price: 40,
          address: "Paris",
          user_id: User.last.id)
  file = File.open('app/assets/images/FLATS/flat 2.jpg')
  flat2.photo.attach(io: file, filename: 'flat 2.jpg', content_type: 'image/jpg')
  # ---------------------------------------------------------------------------
  puts "3rd"
  flat3 = Flat.create!(name: "Villa Florette",
          beds: 5,
          area: 102,
          description: "Sympathique logement soigneusement décoré et aménagé avec des meubles design haut de gamme neufs.
                  - Belle lumière naturelle
                  - Lit très confortable avec matelas épais de qualité.
                  - Wifi haut débit via fibre optique.
                  - Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides ...)
                  - Machine à laver disponible dans une dépendance.
                  - Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  - Rue à sens unique calme et avec de la verdure.
                  - Immeuble résidentiel calme et bien entretenu.
                  - Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  - Maecenas sagittis turpis eget rutrum fringilla.
                  - Quisque mollis sapien et dui maximus efficitur.
                  - Morbi congue neque non aliquam vehicula.
                  - Aliquam pretium lacus ut nunc interdum, sed eleifend sem posuere.

                  Suspendisse convallis eros sem. Phasellus ut odio rhoncus, ultricies justo aliquet, dictum elit. Vivamus tincidunt hendrerit felis, vel finibus sem consequat ut. Aliquam ut nulla convallis, pharetra massa a, egestas ligula.
                  Morbi condimentum odio in mi malesuada mollis. Ut et justo nisi. Praesent maximus at quam non consectetur. Morbi cursus et tortor ac convallis. Morbi sed congue lorem. Pellentesque lobortis ut arcu ac tincidunt. Suspendisse potenti. Ut a ante pulvinar, vulputate quam vel, ultricies orci.",
          daily_price: 120,
          address: "Nice",
          user_id: User.last.id)
  file = File.open('app/assets/images/FLATS/flat 8.jpg')
  flat3.photo.attach(io: file, filename: 'flat 8.jpg', content_type: 'image/jpg')
  # ---------------------------------------------------------------------------
  puts "4th"
  flat4 = Flat.create!(name: "Le calme montagnard",
          beds: 4,
          area: 65,
          description: "Sympathique logement soigneusement décoré et aménagé avec des meubles design haut de gamme neufs.
                  - Belle lumière naturelle
                  - Lit très confortable avec matelas épais de qualité.
                  - Wifi haut débit via fibre optique.
                  - Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides ...)
                  - Machine à laver disponible dans une dépendance.
                  - Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  - Rue à sens unique calme et avec de la verdure.
                  - Immeuble résidentiel calme et bien entretenu.
                  - Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  - Maecenas sagittis turpis eget rutrum fringilla.
                  - Quisque mollis sapien et dui maximus efficitur.
                  - Morbi congue neque non aliquam vehicula.
                  - Aliquam pretium lacus ut nunc interdum, sed eleifend sem posuere.

                  Suspendisse convallis eros sem. Phasellus ut odio rhoncus, ultricies justo aliquet, dictum elit. Vivamus tincidunt hendrerit felis, vel finibus sem consequat ut. Aliquam ut nulla convallis, pharetra massa a, egestas ligula.
                  Morbi condimentum odio in mi malesuada mollis. Ut et justo nisi. Praesent maximus at quam non consectetur. Morbi cursus et tortor ac convallis. Morbi sed congue lorem. Pellentesque lobortis ut arcu ac tincidunt. Suspendisse potenti. Ut a ante pulvinar, vulputate quam vel, ultricies orci.",
          daily_price: 68,
          address: "Lille",
          user_id: User.last.id)
  file = File.open('app/assets/images/FLATS/flat 4.jpg')
  flat4.photo.attach(io: file, filename: 'flat 4.jpg', content_type: 'image/jpg')
  # ---------------------------------------------------------------------------
  puts "5th"
  flat5 = Flat.create!(name: "Châlet bien-être",
          beds: (2..5).to_a.sample,
          area: 62,
          description: "Sympathique logement soigneusement décoré et aménagé avec des meubles design haut de gamme neufs.
                  - Belle lumière naturelle
                  - Lit très confortable avec matelas épais de qualité.
                  - Wifi haut débit via fibre optique.
                  - Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides ...)
                  - Machine à laver disponible dans une dépendance.
                  - Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  - Rue à sens unique calme et avec de la verdure.
                  - Immeuble résidentiel calme et bien entretenu.
                  - Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  - Maecenas sagittis turpis eget rutrum fringilla.
                  - Quisque mollis sapien et dui maximus efficitur.
                  - Morbi congue neque non aliquam vehicula.
                  - Aliquam pretium lacus ut nunc interdum, sed eleifend sem posuere.

                  Suspendisse convallis eros sem. Phasellus ut odio rhoncus, ultricies justo aliquet, dictum elit. Vivamus tincidunt hendrerit felis, vel finibus sem consequat ut. Aliquam ut nulla convallis, pharetra massa a, egestas ligula.
                  Morbi condimentum odio in mi malesuada mollis. Ut et justo nisi. Praesent maximus at quam non consectetur. Morbi cursus et tortor ac convallis. Morbi sed congue lorem. Pellentesque lobortis ut arcu ac tincidunt. Suspendisse potenti. Ut a ante pulvinar, vulputate quam vel, ultricies orci.",
          daily_price: 55,
          address: "Lyon",
          user_id: User.last.id)
  file = File.open('app/assets/images/FLATS/flat 5.jpg')
  flat5.photo.attach(io: file, filename: 'flat 5.jpg', content_type: 'image/jpg')
  # ---------------------------------------------------------------------------
  puts "6th"
  flat6 = Flat.create!(name: "Villa César",
          beds: 6,
          area: 160,
          description: "Sympathique logement soigneusement décoré et aménagé avec des meubles design haut de gamme neufs.
                  - Belle lumière naturelle
                  - Lit très confortable avec matelas épais de qualité.
                  - Wifi haut débit via fibre optique.
                  - Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides ...)
                  - Machine à laver disponible dans une dépendance.
                  - Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  - Rue à sens unique calme et avec de la verdure.
                  - Immeuble résidentiel calme et bien entretenu.
                  - Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  - Maecenas sagittis turpis eget rutrum fringilla.
                  - Quisque mollis sapien et dui maximus efficitur.
                  - Morbi congue neque non aliquam vehicula.
                  - Aliquam pretium lacus ut nunc interdum, sed eleifend sem posuere.

                  Suspendisse convallis eros sem. Phasellus ut odio rhoncus, ultricies justo aliquet, dictum elit. Vivamus tincidunt hendrerit felis, vel finibus sem consequat ut. Aliquam ut nulla convallis, pharetra massa a, egestas ligula.
                  Morbi condimentum odio in mi malesuada mollis. Ut et justo nisi. Praesent maximus at quam non consectetur. Morbi cursus et tortor ac convallis. Morbi sed congue lorem. Pellentesque lobortis ut arcu ac tincidunt. Suspendisse potenti. Ut a ante pulvinar, vulputate quam vel, ultricies orci.",
          daily_price: 155,
          address: "Montpellier",
          user_id: User.last.id)
  file = File.open('app/assets/images/FLATS/flat 6.jpg')
  flat6.photo.attach(io: file, filename: 'flat 6.jpg', content_type: 'image/jpg')
  # ---------------------------------------------------------------------------
  puts "7th"
  flat7 = Flat.create!(name: "La vieille garde",
          beds: 2,
          area: 40,
          description: "Sympathique logement soigneusement décoré et aménagé avec des meubles design haut de gamme neufs.
                  - Belle lumière naturelle
                  - Lit très confortable avec matelas épais de qualité.
                  - Wifi haut débit via fibre optique.
                  - Cuisine équipée (machine à café Bialetti, grille-pain, plaques chauffantes vitro-céramique rapides ...)
                  - Machine à laver disponible dans une dépendance.
                  - Place de parking gratuite au sous-sol. Parking sécurisé avec ouverture via une télécommande.
                  - Rue à sens unique calme et avec de la verdure.
                  - Immeuble résidentiel calme et bien entretenu.
                  - Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  - Maecenas sagittis turpis eget rutrum fringilla.
                  - Quisque mollis sapien et dui maximus efficitur.
                  - Morbi congue neque non aliquam vehicula.
                  - Aliquam pretium lacus ut nunc interdum, sed eleifend sem posuere.

                  Suspendisse convallis eros sem. Phasellus ut odio rhoncus, ultricies justo aliquet, dictum elit. Vivamus tincidunt hendrerit felis, vel finibus sem consequat ut. Aliquam ut nulla convallis, pharetra massa a, egestas ligula.
                  Morbi condimentum odio in mi malesuada mollis. Ut et justo nisi. Praesent maximus at quam non consectetur. Morbi cursus et tortor ac convallis. Morbi sed congue lorem. Pellentesque lobortis ut arcu ac tincidunt. Suspendisse potenti. Ut a ante pulvinar, vulputate quam vel, ultricies orci.",
          daily_price: 38,
          address: "marseille",
          user_id: User.last.id)
  file = File.open('app/assets/images/FLATS/flat 9.jpg')
  flat7.photo.attach(io: file, filename: 'flat 9.jpg', content_type: 'image/jpg')

puts "Finished"
