class SessionsController < ApplicationController

  def new
  end

  def create
    farrier = Farrier.find_by(username: params[:farrier][:username])
    if farrier && farrier.authenticate(params[:farrier][:password])
      session[:farrier_id] = farrier.id
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

  def omniauth
    @farrier = Farrier.from_omniauth(auth)
    @farrier.save
    session[:farrier_id] = @farrier.id
    redirect_to farrier_path(@farrier)
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
