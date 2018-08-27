class ReportsController < ApplicationController
  def set_filters
    @cars = Car.all
  end
end
