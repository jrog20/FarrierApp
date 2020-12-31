class AppointmentsController < ApplicationController
  
  def index
    # if it is nested & we can find the horse (prevent nil class error) & set to instance variable
    if params[:horse_id] && @horse = Horse.find_by_id(params[:horse_id])
      @appointments = @horse.appointments
    else
      @appointments = Appointment.all
    end
  end
  
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_farrier.appointments.build(appointment_params)
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
