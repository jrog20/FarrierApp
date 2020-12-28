class HorsesController < ApplicationController
  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.create(horse_params)
    redirect_to @horse
  end

  def show
    @horse = Horse.find_by(params[:horse_id])
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :needs_shoes, :front_shoes, :hind_shoes, :winter_shoes, :pads, :shoe_size, :temperament, :schedule, :comments)
  end
end