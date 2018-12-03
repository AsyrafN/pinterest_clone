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
	 	user = User.find_by_email(params[:email])
	 	if user && user.authenticate(params[:password]) 
	 		session[:user_id] = user.id
		 		redirect_to "/"
	 	else
	 	  	flash[:danger] = "Incorrect credentials! Please try again!"
			redirect_to root_path
	 	end
	end

	def destroy
	    session[:user_id] = nil
	    redirect_to '/'
	end

	private
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
