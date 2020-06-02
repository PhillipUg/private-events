class EventsController < ApplicationController
  before_action :authorize, except: [:index, :show]


  def index
  	@events = Event.all
  end

  def new
  	@event = current_user.created_events.new
  end

  def create
  	@event = current_user.created_events.build(event_params)
  	if @event.save
	  	redirect_to @event, notice: "Event Successfully Created!"
	  else
	  	render :new
	  end
  end

  def show
  	@event = Event.find(params[:id])
  end

  def join
    @attendance = Attendance.join_event(current_user.id, params[:event_id])
    @attendance.save
      redirect_to event_path(params[:event_id]), notice: "Successfully Joined event"
    # # else
    # #   flash.now.alert = "Failed to Join Event"
    # end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_date)
  end
end
