class User::RequestTrainorsController < ApplicationController

	def create
		request_trainor = RequestTrainor.new(request_trainor_params)
		request_trainor.user_id = current_user.id
		request_trainor.save
		redirect_to request.referrer
	end

	def index
		@requests = RequestTrainor.where(:user_id => current_user.id)
	end



	private

	def request_trainor_params
		params[:request_trainor].permit(:trainor_id)
	end
end