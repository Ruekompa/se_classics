class ListingsController < ApplicationController
 def vehicle_index
  	@vehicles = Vehicle.order("created_at DESC")
  end

  def vehicle_show
  	@vehicle = Vehicle.find params[:id]
  end
end
