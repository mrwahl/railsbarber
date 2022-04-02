class AddUserIdToBarbers < ActiveRecord::Migration[6.1]
  def change
    add_column :barbers, :user_id, :integer
    add_index :barbers, :user_id
  end
end
