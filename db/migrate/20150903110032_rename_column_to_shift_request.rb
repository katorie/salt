class RenameColumnToShiftRequest < ActiveRecord::Migration
  def change
    rename_column :shift_requests, :request_time, :start_time
  end
end
