class WorkoutExercise < ApplicationRecord
	has_one :workout
	belongs_to :exercise
	has_many :workout_sets
end
