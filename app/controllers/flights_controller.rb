class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @available_flights = Flight.all

    @date = params[:date] || Date.today.to_s
    start_time = Date.parse(@date).beginning_of_day
    end_time = Date.parse(@date).end_of_day
    @flights = Flight.where(
      departure_airport_id: params[:departure],
      arrival_airport_id: params[:arrival],
      # https://stackoverflow.com/questions/13211916/rails-activerecord-find-search-by-date
      departure_time: start_time..end_time
    )
  end
end
