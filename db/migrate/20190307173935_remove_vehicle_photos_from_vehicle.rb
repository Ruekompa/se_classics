class RemoveVehiclePhotosFromVehicle < ActiveRecord::Migration[5.2]
  def change
    remove_column :vehicles, :vehicle_photos, :string
  end
end
