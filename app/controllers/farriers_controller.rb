class FarriersController < ApplicationController
  def new
    @farrier = Farrier.new
  end

  def create
    if @farrier = Farrier.create(farrier_params)
      session[:farrier_id] = @farrier.id
      redirect_to farrier_path(@farrier)
    else
      render :new
    end
  end

  def show
    @farrier = Farrier.find_by_id(params[:id])
    redirect_to '/' if !@farrier
  end

  private

  def farrier_params
    params.require(:farrier).permit(:first_name, :last_name, :username, :email, :password, :company_name)
  end
end
