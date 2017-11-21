class TreatmentsController < ApplicationController
  def index
    @treatments = Treatment.where(params[:specialist_id])
  end

  def show
    @treatment = Treatment.find(params[:id])
  end
end
