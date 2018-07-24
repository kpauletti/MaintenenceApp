class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find_by(id: params[:id])
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
    redirect_to root_path
  end

  def completed
    @completed = Ticket.where(completed: true)
  end

  private
  def ticket_params
    params.require(:ticket).permit(:category, :note, :picture, :driveable, :mechanic, :car_id, :completed)
  end

end
