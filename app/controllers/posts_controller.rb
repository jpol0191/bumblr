class PostsController < ApplicationController
  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    post.comments.each do |comment|
      comment.delete
    end
    post.delete
    redirect_to user_path(user)
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
