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

60.times do |idx|
  date1 = Time.now
  date2 = Time.now + (12 * 31 * 24 * 3600)
  # https://stackoverflow.com/questions/2683857/how-to-generate-a-random-date-and-time-between-two-dates
  departure_time = Time.at((date2.to_f - date1.to_f) * rand + date1.to_f)
  arrival_time = departure_time + Random.new.rand(1..20)
  Flight.create(
    {
      departure_time:,
      arrival_time:,
      departure_airport_id: Random.new.rand(1..30),
      arrival_airport_id: Random.new.rand(1..30),
      id: idx,
      price: Random.new.rand(100.00..300.00).round(2)
    }
  )
end
