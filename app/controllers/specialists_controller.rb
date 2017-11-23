class SpecialistsController < ApplicationController
  def index
    @specialists = policy_scope(Specialist)
  end

  def show
    @specialist = Specialist.find(params[:id])
    authorize @specialist
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
end
