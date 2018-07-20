class PagesController < ApplicationController
  def home
  end

  def todo_index
    @todo = Ticket.where(completed: false)
  end

end
