class SpecialistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @specialists = Specialist.all
  end

  def show
    @specialist = Specialist.find(params[:id])
  end

  def new
    @specialist = Specialist.new
  end

  def create
    @specialist = Specialist.new(specialist_params)
    @specialist.user = current_user
    if @specialist.save
      @specialist.user.role = 'specialist'
      redirect_to specialist_path(@specialist)
    else
      render :new
    end
  end

  private

  def specialist_params
    params.require(:specialist).permit(:bio, :work_experience)
  end
end
