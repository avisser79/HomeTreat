class SpecialistsController < ApplicationController
  def index
    @specialists = policy_scope(Specialist)
    subcategory_filter(params[:subcategory]) if params[:subcategory]
    date_filter(params[:date]) unless params[:date].blank?
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
    raise
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

  def date_filter(date_params)
    parsed_params = date_params.split(",")
    selected_dates = parsed_params.map { |d| Date.strptime(d, "%m/%d/%Y") }
    # byebug
    @specialists = @specialists.includes(:availabilities).where({ availabilities: { date: selected_dates } })
  end

  def price_filter(price_params)
    @specialists = @specialists.where( "hourly_rate < ?", price_params)
  end

  def location_filter(loc_params)
  end
end
