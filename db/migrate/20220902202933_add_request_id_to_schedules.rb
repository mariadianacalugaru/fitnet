class AddRequestIdToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :request_id, :integer, null: false
  end
end
