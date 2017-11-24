class TreatmentsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def new
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.specialist = Specialist.find(params[:specialist_id])
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
