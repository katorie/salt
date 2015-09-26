class ChangeDataTypeStartTimeAndEndTime < ActiveRecord::Migration
  def change
    change_column :shift_requests, :start_time, :string
    change_column :shift_requests, :end_time, :string
  end
end
