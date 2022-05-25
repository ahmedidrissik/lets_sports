class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]


  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @location = Location.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      Booking.create(status: "confirmé", event_id: @event.id, player_id: current_user.id)
      redirect_to event_path(@event)
    else
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
    @booking_id = @event.bookings.where(user: current_user).blank? ? 0 : @event.bookings.where(user: current_user).first.id
    #what is this code doing ? on line 26 ?
    #@booking_id = @event.bookings.blank? ? 0 : @event.bookings.first.id
  end


  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render "new"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
  end

  private

  def event_params
    params.require(:event).permit(:sport_id, :creator_id, :description, :location_id, :date, :capacity, :title)
  end
end
