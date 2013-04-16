class Event < ActiveRecord::Base
  belongs_to :calendar
  has_many :event_schedules

  attr_accessible :description, :title, :event_schedules_attributes
  accepts_nested_attributes_for :event_schedules

  validates :title, :presence => true
  validates_associated :event_schedules
end
