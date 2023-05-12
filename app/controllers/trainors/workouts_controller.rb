class Trainors::WorkoutsController  < ApplicationController

	def index
		@workouts = Workout.all
	end

	def new
	end

	def create
		workout = Workout.create(workout_params.except(:workout_exercises))
		workout_params[:workout_exercises].each do |workout_exercise|
			wk = WorkoutExercise.new(workout_exercise.except(:workout_sets))
			wk.workout_id = workout.id
			wk.save
			workout_exercise[:workout_sets].each do |workout_set|
				ws = WorkoutSet.new(workout_set)
				ws.workout_exercise_id = wk.id
				ws.save
			end
		end
		binding.pry
	end

	def show
		@workout = Workout.find(params[:id])
	end


	private 
	def workout_params
		params.require(:workout).permit(
    		:name, 
    		workout_exercises: [
    			:exercise_id,
    			workout_sets: [
    				:duration,
    				:weight,
    				:metric,
    				:reps
    			]
    		]
  		)
	end
end