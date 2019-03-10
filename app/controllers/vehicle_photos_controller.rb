class VehiclePhotosController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_vehicle

  def update_row_order
    @vehicle_photo = VehiclePhoto.find(vehicle_photos_params[:vehicle_photo_id])
    @vehicle_photo.row_order_position = vehicle_photos_params[:row_order_position]
    @vehicle_photo.save

    render body: nil
  end

def destroy
 	@vehicle = Vehicle.find params[:id]
 	@vehicle_photo = VehiclePhoto.find params[:id]


 	@vehicle_photo.destroy
      flash[:notice] = 'Photo Deleted'
      redirect_back fallback_location: root_path
 end

 # def delete_media
 #    @vehicle = Vehicle.find params[:id]
 # 	@vehicle_photo = VehiclePhoto.find params[:id]
 #    VehiclePhoto.where(id: params[:vehicle_photos]).destroy_all
 #      flash[:notice] = 'Photos Trashed'
 #      redirect_back fallback_location: root_path
 #  end

  private

    def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end



  def vehicle_photos_params
    params.require(:vehicle_photo).permit(:vehicle_id, :file_name, :row_order, :row_order_position, :vehicle_photo_id) 
  end
end
