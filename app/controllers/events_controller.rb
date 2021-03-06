class EventsController < ApplicationController
  before_action :authorize, except: %i[index show]

  def index
    @events = Event.all
    @previous_events = @events.past
    @upcoming_events = @events.upcoming
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Event Successfully Created!'
    else
      flash[:notice] = 'Failed to create event. Try again'
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def join
    @attendance = Attendance.join_event(current_user.id, params[:event_id])
    if @attendance.save
      flash[:notice] = 'Successfully Joined event' 
      redirect_to event_path(params[:event_id])
    else
      flash[:alert] = 'Already Joined Event' 
      
      redirect_to event_path(params[:event_id])
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :start_date)
  end
end
