class AgendaController < ApplicationController
  #skip_after_action :verify_authorized

  def new
    @availability = Availability.new
    @availability.specialist = current_user.specialist
    authorize @availability
    respond_to do |format|
      format.html
      format.json { render json: validated_address }
    end
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.specialist = current_user.specialist
    authorize @availability
    if @availability.save
      redirect_to profile_agenda_index_path
    else
      render :new
    end
  end

  def index
    @availabilities = policy_scope(Availability)
    @json_availabilities = @availabilities.map { |a| a.calender_formatting }.to_a
  end

  def edit
    @availability = Availability.find(params[:id])
    authorize @availability
  end

  def update
    @availability = Availability.find(params[:id])
    authorize @availability
    if @availability.update(availability_params)
      redirect_to profile_agenda_index_path
    else
      render :edit
    end
  end

  def show
    @availability = Availability.find(params[:id])
  end

  private

  def availability_params
    params.require(:availability).permit(:start_time, :end_time, :location, :range)
  end
end
