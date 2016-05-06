class CommentsController < ApplicationController
  def index
  end

  def create
  	Comment.create(comment_params)
  	redirect_to user_path(comment_params[:user_id])
  end

  def show
  end

  def destroy
    Comment.find(params[:id]).delete
    redirect_to user_path(params[:user_id])
  end

  private 

  def comment_params
  	params.require(:comment).permit(:body,:post_id,:user_id)
  end
end
