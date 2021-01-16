class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update]
  
  def index
    @owners = current_farrier.owners.alpha.uniq
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.find_or_create_by(owner_params)
  end

  def edit
  end

  def update
    @horse = current_horse
    @owner.update(owner_params)
    if @owner.save
      redirect_to @owner
    else
      render :edit
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:name, :phone, :email, :comments)
  end

  def set_owner
    @owner = Owner.find_by_id(params[:id])
  end
end
