class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :part_num
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
