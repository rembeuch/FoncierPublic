class Owner::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.joins(:flat).where(flats: { owner: current_user })
  end
end
