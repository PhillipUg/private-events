class Event < ApplicationRecord
	belongs_to :creator, class_name: :User

	has_many :attendances, foreign_key: :attended_event_id
	has_many :attendees, through: :attendances, source: :attendee

	validates :name, presence: true, uniqueness: true

	def self.past
		self.where("start_date < ?", Time.now)
	end

	def self.upcoming
		self.where("start_date > ?", Time.now)
	end
end
