class AddVehicleIdToVehiclePhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicle_photos, :vehicle_id, :integer
  end
end
