class PagesController < ApplicationController

	def home
		@vehicles = Vehicle.order("created_at DESC").limit(6)
		@vehicle_photos = VehiclePhoto.rank(:row_order).all
	end

end
