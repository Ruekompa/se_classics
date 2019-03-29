class ListingsController < ApplicationController
	include Pagy::Backend

 def vehicle_index
  	@pagy, @vehicles = pagy(Vehicle.order("created_at DESC"), items: 12)
  	@vehicle_photos = VehiclePhoto.rank(:row_order).all
  end

  def vehicle_show
  	@vehicle = Vehicle.friendly.find params[:id]
  	@vehicle_photos = @vehicle.vehicle_photos.rank(:row_order).all
  end

  def vehicles_sold
 	@pagy, @vehicles = pagy(Vehicle.where(sold: :true).order("created_at DESC"), items: 12)
  	@vehicle_photos = VehiclePhoto.rank(:row_order).all
  end

  def vehicles_trucks
  	@pagy, @vehicles = pagy(Vehicle.where(type_of_vehicle: 'Truck').order("created_at DESC"), items: 12)
  	@vehicle_photos = VehiclePhoto.rank(:row_order).all
  end

  def vehicles_cars
  	@pagy, @vehicles = pagy(Vehicle.where(type_of_vehicle: 'Car').order("created_at DESC"), items: 12)
  	@vehicle_photos = VehiclePhoto.rank(:row_order).all
  end

  def vehicles_motorcycles
  	@pagy, @vehicles = pagy(Vehicle.where(type_of_vehicle: 'Motorcycle').order("created_at DESC"), items: 12)
  	@vehicle_photos = VehiclePhoto.rank(:row_order).all
  end

  def vehicles_classic
  	@pagy, @vehicles = pagy(Vehicle.where("year < ?", Time.new.strftime("%Y").to_i - 25).order("created_at DESC"), items: 12)
  	@vehicle_photos = VehiclePhoto.rank(:row_order).all
  end

end
