class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
    filtering_params.each do |key, value|
      @tickets = @tickets.public_send(key, value) if value.present?
    end

    respond_to do |format|
      format.html
      format.csv { send_data @tickets.to_csv }
      format.xls #{ render "results" }
    end
  end

  def show
    @ticket = Ticket.find_by(id: params[:id])
  end

  def finalize_ticket
    if params[:in_progress] == "true"
      ticket = Ticket.find_by(id: params[:id])
      ticket.in_progress = true
      ticket.save
    end
    @ticket = Ticket.find_by(id: params[:id])
    @parts = Part.order(:name)
  end

  def new
    @ticket = Ticket.new
    @car = Car.find(params[:car_id])
  end

  def edit
    @ticket = Ticket.find(params[:id])
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
    if (@ticket.completed == true)
      @ticket.notify
    end
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

  def filtering_params
    params.permit(:car, :category, :location, :completed, :created_after, :created_before).to_h
  end

  helper_method :filtering_params

  private

  def ticket_params
    params.require(:ticket)
      .permit(:category, :note, {pictures: []}, :driveable, :mechanic, :car_id,
              :completed, :part_used, :time_spent, :location, :in_progress, :repair_under_warranty, :completed_on)
  end
end
