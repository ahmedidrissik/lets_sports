class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @game = @booking.game
      @event = @booking.event
      @booking_id = @booking.id
      if booking_params[:event_id].nil?
        respond_to do |format|
          format.text { render partial: "games/game_details", locals: { game: @game }, formats: [:html] }
        end
      else
        respond_to do |format|
          format.text { render partial: "events/event_details", locals: { event: @event }, formats: [:html] }
        end
      end
    else
      render "new"
    end
  end

  def update
    booking = Booking.find(params[:id])
    booking.status = params[:status]
    booking.save
    unless booking.game_id.nil?
      is_creator = current_user == booking.game.user
      respond_to do |format|
        format.text { render partial: "games/player_card", locals: { booking: booking, is_creator: is_creator }, formats: [:html] }
      end
    else
      is_creator = current_user == booking.event.user
      respond_to do |format|
        format.text { render partial: "events/player_card", locals: { booking: booking, is_creator: is_creator }, formats: [:html] }
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @game = @booking.game
    @event = @booking.event
    @booking_id = @booking.id
    game_id = @booking.game_id
    @booking.delete
    unless game_id.nil?
      respond_to do |format|
        format.text { render partial: "games/game_details", locals: { game: @game }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.text { render partial: "events/event_details", locals: { event: @event }, formats: [:html] }
      end
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:game_id, :player_id, :event_id, :status)
  end
end
