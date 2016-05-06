module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def check_pass(user, pass)
  	user.password ==  pass
  end
end