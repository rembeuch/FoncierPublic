class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end



  def create
    @flat = Flat.find(params[:flat_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.flat = @flat
    @reservation.guest = current_user
    @reservation.set_total_price!

    if @reservation.price >= 0 && @reservation.start_date >= Date.today && @reservation.save
      redirect_to flat_path(@flat)
      flash[:notice] = "Demande de réservation envoyée"
    else
      render :new
      flash[:alert] = "Something went wrong..."
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
