class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_farrier, :logged_in?

  private

    def current_farrier
      @current_farrier ||= Farrier.find_by_id(session[:farrier_id])
    end

    def logged_in?
      !!current_farrier
    end

    def redirect_if_not_logged_in
      redirect_to '/' if !logged_in?
    end

    def current_horse
      @current_horse ||= Horse.find_by_id(params[:horse_id])
    end

end
