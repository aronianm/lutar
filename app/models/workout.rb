class Workout < ApplicationRecord
	has_many :workout_exercises, class_name: 'WorkoutExercise'
end
