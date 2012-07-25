class SessionsController < ApplicationController
  skip_before_filter :authenticate
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user and user.authenticate(params[:password])
  		sign_in(user)
      redirect_back_or(root_url, flash: { success: "Welcome back #{user.name}" })
  	else
  		redirect_to login_url, flash: { alert: "Invalid user/password combination."}
  	end	
  end

  def destroy
  	sign_out
  	redirect_to root_url, flash: { notice: "Logged out" }
  end
end
