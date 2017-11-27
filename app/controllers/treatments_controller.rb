class TreatmentsController < ApplicationController

  def new
    if current_user.specialist.blank?
      redirect_to profile_path
    else
      @treatment = Treatment.new
      @treatment.specialist = current_user.specialist
      authorize @treatment
    end
  end

  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.specialist = current_user.specialist
    authorize @treatment
    if @treatment.save
      redirect_to specialist_path(@treatment.specialist)
    else
      render :new
    end
  end

  private

  def treatment_params
    params.require(:treatment).permit(:description, :duration, :price, :subcategory_id, :segment)
  end
end
