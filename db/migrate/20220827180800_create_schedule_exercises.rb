class CreateScheduleExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :schedule_exercises do |t|
      t.belongs_to :exercise, null: false, foreign_key: true
      t.belongs_to :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
