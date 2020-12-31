class AppointmentsController < ApplicationController
  
  def index
    @appointments = Appointment.all
  end
  
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_farrier.appointments.build(appointment_params)
    if @appointment.save
      redirect_to '/appointments/show'
      # redirect_to appointment_path
    else
      render :new
    end
  end
  
  def show
    @appointment = Appointment.find_by_id(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start, :end, :comments, :farrier_id, :horse_id)
  end
end
