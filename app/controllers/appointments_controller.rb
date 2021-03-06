class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update]

  def index
    # if it is nested & we can find the horse (prevent nil class error) & set to instance variable
    if params[:horse_id] && @horse = Horse.find_by_id(params[:horse_id])
      @appointments = @horse.appointments.order(:date)
    elsif params[:farrier_id] && @farrier = Farrier.find_by_id(params[:farrier_id])
      @appointments = current_farrier.appointments.order(:date)
    else
      @error = flash[:message] = "That horse doesn't exist" if params[:horse_id]
      @appointments = current_farrier.appointments.order(:date)
    end
  end

  def show
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

  def edit
    @horse = Horse.find_by_id(params[:id])
  end

  def update
    @appointment.update(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :edit
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start, :end, :date, :comments, :farrier_id, :horse_id)
  end

  def set_appointment
    @appointment = Appointment.find_by_id(params[:id])
  end
end
