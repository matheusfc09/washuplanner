class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.references :calendar

      t.timestamps
    end
    add_index :events, :calendar_id
  end
end
