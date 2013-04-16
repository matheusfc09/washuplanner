class EventSchedule < ActiveRecord::Base
  belongs_to :event

  attr_accessible :begin, :end
end
