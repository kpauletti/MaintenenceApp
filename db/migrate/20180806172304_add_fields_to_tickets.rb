class AddFieldsToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :location, :string
    add_column :tickets, :final_resolution, :text
    add_column :tickets, :time_spent, :string
    add_column :tickets, :part_used, :string
  end
end
