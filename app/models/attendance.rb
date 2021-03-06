class Attendance < ApplicationRecord
  belongs_to :attended_event, class_name: :Event
  belongs_to :attendee, class_name: :User

  validates :attendee, uniqueness: true

  def self.join_event(user_id, event_id)
    create(attendee_id: user_id, attended_event_id: event_id)
  end
end
