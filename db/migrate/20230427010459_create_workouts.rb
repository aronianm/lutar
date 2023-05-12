class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.timestamps
    end
    create_table :workout_exercises do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.timestamps
    end
    create_table :workout_sets do |t|
      t.integer :workout_exercise_id
      t.decimal :weight
      t.string :metric
      t.integer :reps
      t.time :duration
      t.timestamps
    end

    add_foreign_key :workout_exercises, :workouts , column: :workout_id
    add_foreign_key :workout_exercises, :exercises, column: :exercise_id
    add_foreign_key :workout_sets, :workout_exercises, column: :workout_exercise_id
  end
end
