class Owner::FlatsController < ApplicationController
  def index
    @flats = current_user.flats
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.owner = current_user

    if @flat.save
      redirect_to owner_flats_path
      flash[:notice] = "annonce enregistrée"
    else
      render :new
      flash[:alert] = "Something went wrong..."
    end
  end


  private

  def flat_params
    params.require(:flat).permit(:title, :address, :price_per_day, :photo)
  end

end
