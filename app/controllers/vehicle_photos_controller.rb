class VehiclePhotosController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_vehicle

  def create
    add_more_vehicle_photos(vehicle_photos_params[:vehicle_photos])
    flash[:error] = "Failed uploading images" unless @vehicle.save
    redirect_back fallback_location: root_path
  end

  def destroy
    remove_vehicle_photo_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @vehicle.save
    redirect_back fallback_location: root_path
  end


  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def add_more_vehicle_photos(new_vehicle_photos)
    vehicle_photos = @vehicle.vehicle_photos
    vehicle_photos += new_vehicle_photos
    @vehicle.vehicle_photos = vehicle_photos 
  end

  def remove_vehicle_photo_at_index(index)
    remain_vehicle_photos = @vehicle.vehicle_photos 
    deleted_vehicle_photo = remain_vehicle_photos.delete_at(index) 
    @vehicle.vehicle_photos = remain_vehicle_photos 
    @vehicle.remove_vehicle_photos! if remain_vehicle_photos.empty?
  end




  def vehicle_photos_params
    params.require(:vehicle).permit({vehicle_photos: []}) 
  end
end
