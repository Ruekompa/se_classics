class AddVehiclePhotosToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :vehicle_photos, :string, array: true, default: []
  end
end
