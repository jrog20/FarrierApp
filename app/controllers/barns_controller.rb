class BarnsController < ApplicationController
  before_action :set_barn, only: [:show, :edit, :update]

  def index
    @barns = current_farrier.barns.alpha.uniq
  end

  def show
  end
  
  def new
    @barn = Barn.new
  end

  def create
    @barn = Barn.find_or_create_by(barn_params)
  end

  def edit
  end

  def update
    @barn.update(barn_params)
    if @barn.save
      redirect_to @barn
    else
      render :edit
    end
  end

  private

  def barn_params
    params.require(:barn).permit(:name, :manager_name, :phone, :email, :address, :city, :state, :zip_code, :comments)
  end

  def set_barn
    @barn = Barn.find_by_id(params[:id])
  end
end
