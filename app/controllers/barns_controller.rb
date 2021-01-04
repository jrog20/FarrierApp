class BarnsController < ApplicationController
  def new
    @barn = Barn.new
  end

  #need to connect horses, barns, and owners at creation
  def create
    if @barn = Barn.create(barn_params)
      redirect_to barn_path(@barn)
    else
      render :new
    end
  end

  def show
    @barn = Barn.find_by_id(params[:id])
  end

  private

  def barn_params
    params.require(:barn).permit(:name, :manager_name, :phone, :email, :address, :city, :state, :zip_code, :comments)
  end
end
