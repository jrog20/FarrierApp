class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.find_or_create_by(owner_params)
  end

  def show
    @owner = Owner.find_by_id(params[:id])
  end

  def edit
    @owner = Owner.find_by_id(params[:id])
  end

  def update
    @horse = current_horse
    @owner = Owner.find_by_id(params[:id])
    @owner.update(owner_params)
    if @owner.save
      redirect_to @horse
    else
      render :edit
    end
  end

  def index
    @owners = Owner.all.alpha
  end

  private

  def owner_params
    params.require(:owner).permit(:name, :phone, :email, :comments)
  end
end
