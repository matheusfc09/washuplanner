class Calendar < ActiveRecord::Base
  has_many :events

  attr_accessible :title, :url

  validates :title, :presence => true
end
