class AppointmentsController < ApplicationController
  skip_after_action :verify_policy_scoped, except: [:index]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @specialist = Specialist.find(params[:specialist_id])
    @appointment.specialist = @specialist
    @appointment.user = current_user
    authorize current_user
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @specialist = Specialist.find(params[:specialist_id])
    @appointment.user = current_user
    @appointment.specialist = @specialist
    tr_ids = params[:appointment][:treatment_ids]
    @appointment.treatments << Treatment.where(id: tr_ids)
    authorize current_user
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    authorize current_user
  end

  def edit
    @appointment = Appointment.find(params[:id])
    authorize current_user
  end

  def update
    @appointment = Appointment.find(params[:id])
    authorize current_user
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  private

  def appointment_params
   params.require(:appointment).permit(:location, :status, :treatment_ids, :start_time)
  end


end
