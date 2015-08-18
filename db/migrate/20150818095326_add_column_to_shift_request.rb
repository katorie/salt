class AddColumnToShiftRequest < ActiveRecord::Migration
  def change
    add_column :shift_requests, :member_id, :integer
  end
end
