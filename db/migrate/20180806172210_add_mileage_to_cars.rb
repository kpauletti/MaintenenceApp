class AddMileageToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :mileage, :string
  end
end
