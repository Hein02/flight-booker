# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all

Airport.create(
  [
    {
      code: 'SFO',
      id: 1
    },
    {
      code: 'NYC',
      id: 2
    }
  ]
)

Flight.delete_all

Flight.create(
  [
    {
      departure_time: Time.now + (2 * 7 * 24 * 3600),
      arrival_time: Time.now + (2 * 7 * 26 * 3600),
      price: 220.00,
      departure_airport_id: 1,
      arrival_airport_id: 2,
      id: 1
    }
  ]
)
