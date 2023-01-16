class ChangeAirportsTable < ActiveRecord::Migration[7.0]
  def change
    change_table :airports do |t|
      t.rename :code, :iata
      t.string :icao
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :tz
    end
  end
end
