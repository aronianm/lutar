class WorkoutsController < ApplicationController

  def new_workout
   render :partial => "trainors/workouts/new_workout"
  end


  def create
    binding.pry
  end

end