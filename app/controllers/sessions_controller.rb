class SessionsController < ApplicationController

  def create
    farrier = Farrier.find_by(username: params[:farrier][:username])
    if farrier && farrier.authenticate(params[:farrier][:password])
      session[:id] = farrier.id
      redirect_to farrier_path(farrier)
    else
      flash[:message] = "Incorrect login information. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
