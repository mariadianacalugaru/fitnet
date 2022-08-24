class AddPtToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :pt_id, :integer
  end
end
