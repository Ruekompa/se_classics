class RemoveVehiclePhotoFromVehicle < ActiveRecord::Migration[5.2]
  def change
    remove_column :vehicles, :vehicle_photo, :string
  end
end
