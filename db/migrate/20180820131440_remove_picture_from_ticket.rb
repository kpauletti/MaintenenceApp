class RemovePictureFromTicket < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :picture, :string
  end
end
