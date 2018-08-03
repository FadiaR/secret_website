class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    # Log the user in and redirect to the user's show page.
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      
      log_in(user)
      remember user if params[:remember_me]
      if params[:remember_me]
        puts "REMEMBER"
      end
      flash[:success] = "Login successful"
      redirect_to root_path
    else
      # show error
      flash[:danger] = "Login unsuccessful"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = "Logout successful"
    redirect_to root_path
  end
end
