class Owner::FlatsController < ApplicationController
  def index
    @flats = current_user.flats
  end

  def new
    @flat = Flat.new
  end

  def create

  end
end
