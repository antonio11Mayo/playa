class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(
      license_plate: params[:car][:license_plate],
      model: params[:car][:model],
      tint: params[:car][:tint]
    )
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(license_plate: params[:car][:license_plate],
                   model: params[:car][:model],
                   tint: params[:car][:tint])
      redirect_to cars_path
    else
      render :edit
    end
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy

    redirect_to cars_path
  end
end
