class AddToScheduleExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :schedule_exercises, :rep, :integer
    add_column :schedule_exercises, :time, :integer
    add_column :schedule_exercises, :series, :integer
  end
end
