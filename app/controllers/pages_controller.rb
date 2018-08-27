class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @tickets = Ticket.where(completed: false, driveable: false).order(:created_at).limit(3)
  end

  def todo_index
    if params[:filter] && params[:filter] != "All"
      @todo = Ticket.where(completed: false, driveable: true, location: params[:filter]).order(created_at: :asc)
      @high_priority_todo = Ticket.where(completed: false, driveable: false, location: params[:filter]).order(created_at: :asc)
    elsif params[:filter] == "All"
      @todo = Ticket.where(completed: false, driveable: true).order(created_at: :asc)
      @high_priority_todo = Ticket.where(completed: false, driveable: false).order(created_at: :asc)
    else
      @todo = Ticket.where(completed: false, driveable: true).order(created_at: :asc)
      @high_priority_todo = Ticket.where(completed: false, driveable: false).order(created_at: :asc)
    end

    @data = @todo + @high_priority_todo
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def calendar
  end

  def admin
  end
end
