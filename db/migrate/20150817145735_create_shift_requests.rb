class CreateShiftRequests < ActiveRecord::Migration
  def change
    create_table :shift_requests do |t|
      t.date :date
      t.string :comment
      t.integer :slot

      t.timestamps null: false
    end
  end
end
