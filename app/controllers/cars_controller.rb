class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to root_path
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def all_cars
    @cars = Car.all
  end

  private

  def car_params
    params.require(:car).permit(:name, :generation)
  end
end
