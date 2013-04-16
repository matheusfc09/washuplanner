class Event < ActiveRecord::Base
  belongs_to :calendar
  has_many :event_schedules

  attr_accessible :description, :title
end
