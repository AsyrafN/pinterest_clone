class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user

	def current_user
	  if session[:user_id]
	      @current_user ||= User.find_by_id(session[:user_id])
	  end
	end
	helper_method :current_user

	def authorize
	  redirect_to '/sign_in' unless current_user
	end
end
