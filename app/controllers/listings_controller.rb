class ListingsController < ApplicationController
	include Pagy::Backend

 def vehicle_index
  	@pagy, @vehicles = pagy(Vehicle.order("created_at DESC"), items: 12)
  	@vehicle_photos = VehiclePhoto.all
  end

  def vehicle_show
  	@vehicle = Vehicle.find params[:id]
  	@vehicle_photos = @vehicle.vehicle_photos.all
  end
end
