class HorsesController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @horses = Horse.all
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = current_farrier.horses.build(horse_params)
    binding.pry

    if @horse.save
      redirect_to horse_path
    else
      render :new
    end
  end

  def show
    @horse = Horse.find_by_id(params[:id])
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :needs_shoes, :front_shoes, :hind_shoes, :winter_shoes, :pads, :shoe_size, :temperament, :schedule, :comments, :farrier_id)
  end
end