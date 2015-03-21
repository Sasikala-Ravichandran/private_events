class Attendance < ActiveRecord::Base
  belongs_to :attendees, class_name: "User"
  belongs_to :attending_events, class_name: "Event"
end
