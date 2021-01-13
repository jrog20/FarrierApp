class BarnsController < ApplicationController
  def new
    @barn = Barn.new
  end

  def create
    @barn = Barn.find_or_create_by(barn_params)
  end

  def show
    @barn = Barn.find_by_id(params[:id])
  end

  def edit
    @barn = Barn.find_by_id(params[:id])
  end

  def update
    @barn = Barn.find_by_id(params[:id])
    @barn.update(barn_params)
    if @barn.save
      redirect_to barns_path
    else
      render :edit
    end
  end

  def index
    @barns = Barn.all
  end

  private

  def barn_params
    params.require(:barn).permit(:name, :manager_name, :phone, :email, :address, :city, :state, :zip_code, :comments)
  end
end
