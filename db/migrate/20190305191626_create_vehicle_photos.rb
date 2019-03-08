class CreateVehiclePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_photos do |t|
      t.string :file_name
      t.integer :row_order

      t.timestamps
    end
  end
end
