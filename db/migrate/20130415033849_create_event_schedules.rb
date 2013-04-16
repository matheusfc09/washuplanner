class CreateEventSchedules < ActiveRecord::Migration
  def change
    create_table :event_schedules do |t|
      t.references :event
      t.datetime :begin
      t.datetime :end

      t.timestamps
    end
    add_index :event_schedules, :event_id
  end
end
