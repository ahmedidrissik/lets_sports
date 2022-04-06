class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @game = @booking.game
      @booking_id = @booking.id
      respond_to do |format|
        format.text { render partial: "games/game_details", locals: { game: @game }, formats: [:html] }
      end
    else
      render "new"
    end
  end

  def update
    booking = Booking.find(params[:id])
    booking.status = params[:status]
    booking.save
  end

  def destroy
    @booking = Booking.find(params[:id])
    @game = @booking.game
    @booking_id = @booking.id
    @booking.delete
    respond_to do |format|
      format.text { render partial: "games/game_details", locals: { game: @game }, formats: [:html] }
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:game_id, :player_id, :status)
  end
end
