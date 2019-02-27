class ListingsController < ApplicationController
	include Pagy::Backend

 def vehicle_index
  	@pagy, @vehicles = pagy(Vehicle.order("created_at DESC"), items: 12)
  end

  def vehicle_show
  	@vehicle = Vehicle.find params[:id]
  end
end
