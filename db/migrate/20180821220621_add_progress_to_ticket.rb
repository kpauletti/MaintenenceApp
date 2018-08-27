class AddProgressToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :in_progress, :boolean
  end
end
