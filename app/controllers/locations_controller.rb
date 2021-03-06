class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to params[:match] == "true" ? new_game_path : new_event_path
    else
      render "new"
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city)
  end
end
