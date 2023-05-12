class WorkoutSet < ApplicationRecord
	belongs_to :workout_exercise
	has_one :workout, through: :workout_exercise
end
