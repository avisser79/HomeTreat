class SpecialistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @specialists = policy_scope(Specialist)
    subcategory_filter(params[:subcategory]) if params[:subcategory]
    time_filter(params[:time]) unless params[:time].blank?
    price_filter(params[:price]) unless params[:price].blank?
    location_filter(params[:location]) unless params[:location].blank?
  end

  def show
    @specialist = Specialist.find(params[:id])
    @json_availabilities = @specialist.availabilities.map { |a| helpers.appointment_formatting(a) }.to_a
    @appointment = Appointment.new
    authorize @specialist
    respond_to do |format|
      format.html
      format.json { render json: @json_availabilities }
    end
  end

  def new
    @specialist = Specialist.new
    @specialist.user = current_user
    authorize @specialist
  end

  def create
    @specialist = Specialist.new(specialist_params)
    @specialist.user = current_user
    authorize @specialist
    if @specialist.save
      current_user.is_specialist = true
      current_user.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @specialist = Specialist.find(params[:id])
    authorize @specialist
  end

  def update
    @specialist = Specialist.find(params[:id])
    authorize @specialist
    if @specialist.update(specialist_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def specialist_params
    params.require(:specialist).permit(:bio, :work_experience, :specialization)
  end

  def subcategory_filter(subcat_params)
    @specialists = @specialists.includes(:treatments).where({ treatments: { subcategory: subcat_params } })
  end

  # def time_filter(time_params)
  #   @specialists = @specialists.joins(:availabilities).where({ availabilities: { "? BETWEEN ? AND ?", time_params, start_time:, end_time: } })
  # end

  def price_filter(price_params)
    @specialists = @specialists.where( "hourly_rate < ?", price_params)
  end

  def location_filter(loc_params)
  end
end
