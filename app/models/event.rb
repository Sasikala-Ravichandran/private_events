class Event < ActiveRecord::Base
	
  belongs_to :creator, :class_name => "User"
  
  has_many :attendance, foreign_key: "attending_events_id"
  has_many :attendees, through: :attendance
  
  scope :upcoming, -> { where("date >= ?",Date.today) }
  scope :past, -> { where("date < ?",Date.today) }

end