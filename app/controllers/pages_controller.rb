class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
  end

  def todo_index
    @todo = Ticket.where(completed: false, driveable: true)
    @high_priority_todo = Ticket.where(completed: false, driveable: false)
  end

end
