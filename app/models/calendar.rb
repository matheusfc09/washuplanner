class Calendar < ActiveRecord::Base
  has_many :events

  attr_accessible :title, :url
end
