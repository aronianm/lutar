class User::TrainorsController < ApplicationController

	def index
		@trainors = Trainor.all
	end

end