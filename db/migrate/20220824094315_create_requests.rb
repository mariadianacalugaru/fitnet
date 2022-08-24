class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :age
      t.integer :height
      t.integer :weight
      t.boolean :abs, default: false
      t.boolean :biceps, default: false
      t.boolean :cardio, default: false
      t.boolean :glutes, default: false
      t.boolean :hamstrings, default: false
      t.boolean :pectorals, default: false
      t.boolean :quads, default: false
      t.boolean :triceps, default: false
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
