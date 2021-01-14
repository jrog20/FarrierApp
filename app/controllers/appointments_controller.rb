class AppointmentsController < ApplicationController
  
  def index
    # if it is nested & we can find the horse (prevent nil class error) & set to instance variable
    if params[:horse_id] && @horse = Horse.find_by_id(params[:horse_id])
      @appointments = @horse.appointments.order(:date)
    elsif params[:farrier_id] && @farrier = Farrier.find_by_id(params[:farrier_id])
      @appointments = @farrier.appointments.order(:date)
    else
      @error = flash[:message] = "That horse doesn't exist" if params[:horse_id]
      @appointments = Appointment.all.order(:date)
    end
  end
  
  def new
    if params[:horse_id] && @horse = Horse.find_by_id(params[:horse_id])
      @appointment = @horse.appointments.build
    else
      @error = flash[:message] = "That horse doesn't exist" if params[:horse_id]
      @appointment = Appointment.new
    end
  end

  def create
    @appointment = current_farrier.appointments.build(appointment_params)
    @horses = Horse.all.name
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end
  
  def show
    @appointment = Appointment.find_by_id(params[:id])
  end

  def edit
    @appointment = Appointment.find_by_id(params[:id])
  end

  def update
    @appointment = Appointment.find_by_id(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start, :end, :date, :comments, :farrier_id, :horse_id)
  end
end
