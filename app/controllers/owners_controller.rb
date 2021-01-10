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

  private

  def owner_params
    params.require(:owner).permit(:name, :phone, :email, :comments)
  end
end
