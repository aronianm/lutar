class User::TrainorsController < ApplicationController

	def index
		@trainors = Trainor.joins("""
			left join request_trainors as rt on rt.trainor_id = trainors.id 
			and rt.user_id = #{current_user.id}
			""").where("rt.id is null").all
	end

end