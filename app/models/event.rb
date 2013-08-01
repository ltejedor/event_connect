class Event < ActiveRecord::Base
  attr_accessible :description, :ends_at, :equipment, :job_type, :room_booked, :starts_at, :title

  validates :title, :presence => true

  belongs_to :user
end
