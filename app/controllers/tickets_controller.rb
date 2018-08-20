class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find_by(id: params[:id])
  end

  def finalize_ticket
    @ticket = Ticket.find_by(id: params[:id])
    @parts = Part.all
  end

  def new
    @ticket = Ticket.new
    @car = Car.find(params[:car_id])
  end

  def create
    @ticket = Ticket.new(ticket_params)

    @ticket.save
    redirect_to todo_path
  end

  def update
    @ticket = Ticket.find_by(id: params[:id])
    @ticket.update(ticket_params)
    @ticket.save
    if (params[:ticket][:part_used] && params[:ticket][:part_used].length > 1)
      part = Part.find(params[:ticket][:part_used])
      part.quantity -= 1
      part.save
    end
    redirect_to root_path
  end

  def completed
    if params[:filter]
      @completed = Ticket.where(completed: true, location: params[:filter])
    else
      @completed = Ticket.where(completed: true)
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:category, :note, {pictures: []}, :driveable, :mechanic, :car_id, :completed, :part_used, :time_spent, :location)
  end
end
