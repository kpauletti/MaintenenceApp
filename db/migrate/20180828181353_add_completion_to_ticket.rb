class AddCompletionToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :completed_on, :datetime
  end
end
