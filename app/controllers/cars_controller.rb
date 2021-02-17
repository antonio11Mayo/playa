class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new; end

  def create
    new_car = Car.new(
      license_plate: params[:car][:license_plate],
      model: params[:car][:model],
      tint: params[:car][:tint]
    )
    new_car.save
    redirect_to cars_path
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update(license_plate: params[:car][:license_plate],
               model: params[:car][:model],
               tint: params[:car][:tint])
    redirect_to cars_path
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy

    redirect_to cars_path
  end
end
