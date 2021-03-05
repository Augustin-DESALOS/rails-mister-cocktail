class DosesController < ApplicationController

  def new
      @doses = Doses.new
  end

  def create
    @doses = Doses.new(doses_params)
    if @doses.save
      redirect_to s(@doses)
    else
      render :new
    end
  end

  def destroy
    @doses = Doses.find(params[:id])
    @doses.destroy
    redirect_to dose_path(@doses.restaurant)
  end
end

