class AddVehiclePhotoToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :vehicle_photo, :string
  end
end
