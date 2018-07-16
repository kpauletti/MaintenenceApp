class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :category
      t.string :note
      t.string :picture
      t.boolean :driveable
      t.string :mechanic
      t.boolean :completed
      t.belongs_to :car, foreign_key: true

      t.timestamps
    end
  end
end
