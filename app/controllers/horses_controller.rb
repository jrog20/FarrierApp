class HorsesController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    if params[:farrier_id] && @farrier = Farrier.find_by_id(params[:farrier_id])
      @horses = @farrier.horses.alpha
    else
      redirect_to root_path
    end
  end

  def new
    if params[:farrier_id] && @farrier = Farrier.find_by_id(params[:farrier_id])
      @horse = @farrier.horses.build
    else
      @horse = Horse.new
    end
    @horse.build_barn
    @horse.build_owner
  end

  def create
    binding.pry
    @barn = Barn.find_or_create_by(params[:barn_name])
    # params[:horse][:barn][:name] = "Testie's Barn"

    @horse = current_farrier.horses.build(horse_params)
    if @horse.save
      redirect_to horse_path(@horse)
    else
      render :new
    end
  end

  def show
    @horse = Horse.find_by_id(params[:id])
  end

  def edit
    @horse = Horse.find_by_id(params[:id])
  end

  def update
    @horse = Horse.find_by_id(params[:id])
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :needs_shoes, :front_shoes, :hind_shoes, :winter_shoes, :pads, :shoe_size, :temperament, :schedule, :comments, :farrier_id, :barn_id, :owner_id, :barn_name, :owner_name)
  end
end