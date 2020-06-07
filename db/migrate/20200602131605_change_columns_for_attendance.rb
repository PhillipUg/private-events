class ChangeColumnsForAttendance < ActiveRecord::Migration[6.0]
  def change
  	rename_column :attendances, :user_id, :attendee_id
  	rename_column :attendances, :event_id, :attended_event_id
  end
end
