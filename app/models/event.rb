class Event < ActiveRecord::Base
	belongs_to :creator, :class_name => "User"
	has_many :attendance, foreign_key: "attending_events_id"
	has_many :attendees, through: :attendance
end
