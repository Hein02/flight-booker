# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

Airport.delete_all

if Airport.count.zero?
  path = File.join(File.dirname(__FILE__), './seeds/airports.json')
  records = JSON.parse(File.read(path))
  records.each_with_index do |(_, record), idx|
    break if idx == 30

    Airport.create!(
      {
        id: idx + 1,
        icao: record['icao'],
        iata: record['iata'],
        name: record['name'],
        city: record['city'],
        state: record['state'],
        country: record['country'],
        tz: record['tz']
      }
    )
  end
  puts 'airports are seeded'
end

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
    },
    {
      departure_time: Time.now + (3 * 7 * 24 * 3600),
      arrival_time: Time.now + (3 * 7 * 26 * 3600),
      price: 320.50,
      departure_airport_id: 2,
      arrival_airport_id: 4,
      id: 2
    },
    {
      departure_time: Time.now + (2 * 8 * 24 * 3600),
      arrival_time: Time.now + (2 * 8 * 26 * 3600),
      price: 270.00,
      departure_airport_id: 10,
      arrival_airport_id: 12,
      id: 3
    },
    {
      departure_time: Time.now + (2 * 10 * 24 * 3600),
      arrival_time: Time.now + (2 * 10 * 30 * 3600),
      price: 130.00,
      departure_airport_id: 15,
      arrival_airport_id: 2,
      id: 4
    },
    {
      departure_time: Time.now + (2 * 12 * 24 * 3600),
      arrival_time: Time.now + (2 * 12 * 32 * 3600),
      price: 235.00,
      departure_airport_id: 6,
      arrival_airport_id: 9,
      id: 5
    },
    {
      departure_time: Time.now + (2 * 7 * 24 * 3600),
      arrival_time: Time.now + (2 * 7 * 26 * 3600),
      price: 220.00,
      departure_airport_id: 1,
      arrival_airport_id: 2,
      id: 6
    }
  ]
)
