class CalculationsController < ApplicationController
  def new
    @calculation = Calculation.new
  end

  def create
    @calculation = Calculation.new(calculation_params)
    @calculation.valid?
    render :new
  end
  
  private
  
  def calculation_params
    params.require(:calculation).permit(:cidr_notation_range)
  end
  
end
