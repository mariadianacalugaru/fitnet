class AddUserIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :user_id, :integer, null: false
  end
end
