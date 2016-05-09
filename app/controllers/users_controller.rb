class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create

		if !User.find_by(username: user_params[:username]) 
			if params[:user][:password] == params[:user][:repassword]
				user = User.create(username: params[:user][:username], password: params[:user][:password])
				log_in user
				redirect_to user_path(user)
			else
				flash[:danger] = "Please verify password."
				redirect_to new_user_path
			end
		else
			flash[:danger] = "User name has already been taken."
			redirect_to new_user_path
		end
	end

  def index
  	
  end

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def edit
  	@user = User.find(params[:id])
    
  end

  def update
  	User.update(params[:id] ,user_params)
  	redirect_to edit_user_path(User.find(params[:id]))
  end

  def destroy
  	session.clear
  	user = User.find(params[:id])
  	user.posts.each do |post|
  		post.comments.each do |comment|
  			comment.delete
  		end
  		post.delete
  	end
  	user.delete
  	redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:username,:password)
  end
end
