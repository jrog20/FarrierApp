class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_farrier, :logged_in?

  private

  def current_farrier
    @current_farrier ||= Farrier.find_by_id(session[:farrier_id]) if session[:farrier_id]
  end

  def logged_in?
    !!session[:farrier_id]
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end
end
