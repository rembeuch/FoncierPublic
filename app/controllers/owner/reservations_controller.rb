class Owner::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.joins(:flat).where(flats: { owner: current_user })
  end

  def accept
      @reservation = Reservation.find(params[:id])
      @reservation.status = "acceptée"
      @reservation.save
      redirect_to owner_reservations_path
  end

  def decline
      @reservation = Reservation.find(params[:id])
      @reservation.status = "refusée"
      @reservation.save
      redirect_to owner_reservations_path
  end
end
