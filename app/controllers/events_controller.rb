class EventsController < ApplicationController
  def index
  	@events = Event.all
  	@event = Event.new
  end

  def new
  	@event = current_user.created_events.new
  end

  def create
  	@event = current_user.created_events.build(params.require(:event).permit(:name))
  	if @event.save
	  	redirect_to @event, notice: "Event Successfully Created!"
	  else
	  	render :new
	  end
  end

  def show
  	@event = Event.find(params[:id])
  end
end
