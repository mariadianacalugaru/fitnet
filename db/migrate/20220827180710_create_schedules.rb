class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|

      t.integer :user_id
      t.integer :pt_id
      t.text :description

      t.timestamps
    end
  end
end
