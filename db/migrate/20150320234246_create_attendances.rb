class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :attendees, index: true
      t.references :attending_events, index: true

      t.timestamps null: false
    end
    add_foreign_key :attendances, :attendees
    add_foreign_key :attendances, :attending_events
  end
end
