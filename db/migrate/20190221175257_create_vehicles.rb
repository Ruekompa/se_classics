class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :title
      t.text :description
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.boolean :sold
      t.string :type_of_vehicle

      t.timestamps
    end
  end
end
