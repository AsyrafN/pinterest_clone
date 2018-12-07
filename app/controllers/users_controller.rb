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

	def create_from_omniauth
	  auth_hash = request.env["omniauth.auth"]
	  authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

	  # if: previously already logged in with OAuth
	  if authentication.user
	    user = authentication.user
	    authentication.update_token(auth_hash)
	    @next = root_url
	    @notice = "Signed in!"
	 
	 else
	    user = User.create_with_auth_and_hash(authentication, auth_hash)
	   
	    
	  end

	  session[:user_id] = user.id
	  redirect_to root_path
	end	

	private
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
