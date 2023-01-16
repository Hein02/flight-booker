class BookingsController < ApplicationController
  def new
    @num_passengers = params[:num_passengers]
    flight_id = params[:flight]
    @flight = Flight.find(flight_id)
  end

  def create
    flight = Flight.find(booking_params[:flight_id])
    passengers = booking_params[:passengers]
    booking = flight.bookings.build
    booking.passengers.build(passengers)
    if booking.save
      flash[:success] = 'Congratulation! Enjoy your trip.'
      redirect_to booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    # To permit nested parameters in Strong parameters
    # https://github.com/rails/strong_parameters#nested-parameters
    params.require(:booking).permit(:flight_id, passengers: %i[name email])
  end
end
