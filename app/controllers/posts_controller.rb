class PostsController < ApplicationController
  def index
  end

  def show
  end

  def create
  	Post.create(post_params)
  	redirect_to current_user
  end

  private
  def post_params
	  params.require(:post).permit(:title, :body, :user_id)
  end
end
