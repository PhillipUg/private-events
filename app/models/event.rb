class Event < ApplicationRecord
	belongs_to :creator, class_name: :User

	has_many :attendances, foreign_key: :attended_event_id
	has_many :attendees, through: :attendances, source: :attendee

	validates :name, presence: true, uniqueness: true

	scope :past, -> {where("start_date < ?", Time.now)}
	scope :upcoming, -> {where("start_date > ?", Time.now)}

end
