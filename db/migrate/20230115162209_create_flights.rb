class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.datetime :arrival_time
      t.decimal :price
      t.references :arrival_airport, references: :airports, null: false
      t.references :departure_airport, references: :airports, null: false

      t.timestamps
    end
  end
end
