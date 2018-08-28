class AddWarrantyToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :repair_under_warranty, :boolean
  end
end
