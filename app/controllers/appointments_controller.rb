class AppointmentsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  # geen index nodig
 # def index
 #   @appointments = Appointment.all
 # end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      # appointment_path heeft params nodig
      # redirect_to appointment_path
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  #delete not needed?

  private

  def appointment_params
   params.require(:appointment).permit(:location, :status, :treatment, :start_time)
  end
end
