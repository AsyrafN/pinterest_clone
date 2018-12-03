class UsersController < ApplicationController

	def index
	end

	def new
	  @user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to '/'
		else
			redirect_to '/sign_up'
		end
	end

	def login
	 	user = User.find_by_email(user_params[:email])
	 	if user && user.authenticate(user_params[:password]) 
	 		session[:user_id] = user.id
		 		redirect_to "/"
	 	else
	 	  	flash[:danger] = "Incorrect credentials! Please try again!"
			redirect_to sign_in_path
	 	end
	end

	private
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
