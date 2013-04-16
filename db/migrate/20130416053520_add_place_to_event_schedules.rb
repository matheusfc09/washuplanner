class AddPlaceToEventSchedules < ActiveRecord::Migration
  def change
    add_column :event_schedules, :place, :string
  end
end
