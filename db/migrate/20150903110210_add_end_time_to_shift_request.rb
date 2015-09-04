class AddEndTimeToShiftRequest < ActiveRecord::Migration
  def change
    add_column :shift_requests, :end_time, :time
  end
end
