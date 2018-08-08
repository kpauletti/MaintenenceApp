class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @tickets = Ticket.where(completed: false).order(:created_at).limit(3)
  end

  def todo_index
    @todo = Ticket.where(completed: false, driveable: true)
    @high_priority_todo = Ticket.where(completed: false, driveable: false)
  end

  def calendar
  end

  def admin
  end
end
