class AddUserIdToDojots < ActiveRecord::Migration[7.0]
  def change
    add_column :dojots, :user_id, :integer
    add_index :dojots, :user_id
  end
end
