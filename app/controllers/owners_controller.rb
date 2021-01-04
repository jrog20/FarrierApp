class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  #need to connect horses, barns, and owners at creation
  def create
    if @owner = Owner.create(owner_params)
      redirect_to owner_path(@owner)
    else
      render :new
    end
  end

  def show
    @owner = Owner.find_by_id(params[:id])
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :phone, :email, :comments)
  end
end
