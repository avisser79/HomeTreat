class AgendaController < ApplicationController
  def new
    @availability = Availability.new
    @availability.specialist = current_user.specialist
    authorize @availability
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
      render :new
    end
  end

  private

  def availability_params
    params.require(:availability).permit(:start_time, :end_time, :location, :range)
  end
end
