class Api::V1::BaseController < ActionController::Base
#before_filter :authenticate_user
respond_to :json

#private
#	def authenticate_user
#		@current_user = User.find_by_authentication_token(params[:token])
#	end
	
#	def current_user
#		@current_user
#	end

end
