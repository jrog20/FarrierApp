class AppointmentsController < ApplicationController
  
  def index
    # if it is nested & we can find the horse (prevent nil class error) & set to instance variable
    # binding.pry
    if params[:horse_id] && @horse = Horse.find_by_id(params[:horse_id])
      @appointments = @horse.appointments
    elsif params[:farrier_id] && @farrier = Farrier.find_by_id(params[:farrier_id])
      @appointments = @farrier.appointments
    else
      @error = flash[:message] = "That horse doesn't exist" if params[:horse_id]
      @appointments = Appointment.all
    end
  end
  
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_farrier.appointments.build(appointment_params)
    @horses = Horse.all.name
    if @appointment.save
      redirect_to appointments_path
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
    params.require(:appointment).permit(:start, :end, :comments, :farrier_id, :horse_id)
  end
end
