class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "new"
    end
  end

  def delete
    @booking = Booking.find(params[:id])
    @booking.delete
  end


  private

  def booking_params
    params.require(:booking).permit(:game_id, :player_id, :status)
  end
end
