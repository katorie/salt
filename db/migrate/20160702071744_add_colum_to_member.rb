class AddColumToMember < ActiveRecord::Migration
  def change
    add_column :members, :code, :integer
  end
end
