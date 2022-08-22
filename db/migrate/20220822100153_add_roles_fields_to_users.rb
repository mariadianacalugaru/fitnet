class AddRolesFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false 
    add_column :users, :pt, :boolean, default: false 
  end
end
