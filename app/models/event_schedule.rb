class EventSchedule < ActiveRecord::Base
  belongs_to :event

  attr_accessible :begin, :end, :place

  validates :begin, :presence => true
end
