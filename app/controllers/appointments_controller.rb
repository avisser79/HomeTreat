class AppointmentsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  # geen index nodig
 # def index
 #   @appointments = Appointment.all
 # end

  def new
    @appointment = Appointment.new
    @specialist = Specialist.find(params[:specialist_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    tr_ids = params[:appointment][:treatment_ids]
    @appointment.treatments << Treatment.where(id: tr_ids)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      @specialist = Specialist.find(params[:specialist_id])
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
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  #delete not needed?

  private

  def appointment_params
   params.require(:appointment).permit(:location, :status, :treatment_ids, :start_time)
  end
end
