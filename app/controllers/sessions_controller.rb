class SessionsController < ApplicationController
  def new
  	if session[:user_id]
  		redirect_to current_user
  	end
  end

  def create
  	user = User.find_by(username: params[:session][:username])
    if user && check_pass(user,params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  	session.clear
  	redirect_to root_path
  end
end
