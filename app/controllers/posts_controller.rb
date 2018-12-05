class PostsController < ApplicationController

	def index
		@posts = Post.where(user_id: current_user.id)
	end

	def new
	  	@post = Post.new
	end

	def create
	   @post = Post.new(post_params)
	   @post.user_id = current_user.id
	   @user = User.find(@post.user_id)
	   if @post.save
	     redirect_to post_path(@post.id)
	   else
	     render new_post_path
	   end
	end

	def show
	@post = Post.find(params[:id])
	end

	def search
		@posts = Post.all
    	if params[:search]
      		@posts = @posts.search_by_posts(params[:search])
    	else
      		redirect_to posts_path
    	end
	end

	private
	def post_params
	  params.require(:post).permit(:user_id, :caption, :photo)
	end
end
