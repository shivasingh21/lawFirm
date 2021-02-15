class SessionsController < ApplicationController
  def new
    return unless logged_in?

    flash[:warning] = "You have already logged in."
    redirect_to root_path
  end

  def create
    user = User.find_by( email: params[ :session ][ :email ].downcase )
    if user && user.authenticate( params[ :session ][ :password ] )
      session[:user_id] = user.id
      flash[:notice] = " Logged in Successfully "
      redirect_to root_path
    else
      flash.now[:notice] = " There was something wrong with your login details "
      render "new"
    end
  end


  def destroy
    if logged_in?
      session[ :user_id ] = nil
      flash[ :notice ] = " Logged Out "
      redirect_to root_path
    else
      flash[ :notice ] = " You are not logged in "
      redirect_to login_path
    end
  end

end
