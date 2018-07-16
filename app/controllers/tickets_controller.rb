class TicketsController < ApplicationController
  def index
  end

  def show
    @ticket = Ticket.find_by(id: params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
 
    @ticket.save
    redirect_to @ticket, notice: "New ticket created!"
  end

  private
  def ticket_params
    params.require(:ticket).permit(:category, :note, :picture, :driveable, :mechanic, :car_id, :completed)
  end

end
