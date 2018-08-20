class AddPicturesToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :pictures, :json
  end
end
