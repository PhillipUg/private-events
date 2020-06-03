class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :previous_events
  helper_method :upcoming_events
  helper_method :upcoming
  helper_method :past

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end

  def upcoming
    Event.upcoming.all
  end

  def past
    Event.past.all
  end

  def upcoming_events
    @upcoming_events ||= current_user.attended_events.where('start_date > ?', Time.now)
  end

  def previous_events
    @previous_events ||= current_user.attended_events.where('start_date < ?', Time.now)
  end
end
