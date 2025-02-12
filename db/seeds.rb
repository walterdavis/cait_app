# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[ 'Blue', 'No, Green', 'Aaauugghh!' ].each_with_index do |color, idx|
  Color.find_or_create_by(name: color, position: idx)
end

[ { name: 'Grail-shaped', position: 0, customize: false, price_cents: 10_000 },
  { name: 'Harmless bunny rabbit', position: 1, customize: false, price_cents: 10_000 },
  { name: 'Holy hand-grenade', position: 2, customize: false, price_cents: 10_000 },
  { name: 'Garden stake', position: 3, customize: true, price_cents: 10_000 }
].each do |shape|
  Shape.find_or_create_by(**shape)
end
