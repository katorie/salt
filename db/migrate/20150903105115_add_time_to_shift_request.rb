class AddTimeToShiftRequest < ActiveRecord::Migration
  def change
    add_column :shift_requests, :request_time, :time
  end
end
