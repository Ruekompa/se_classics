class VehiclesController < ApplicationController
	before_action :authenticate_admin!
	layout 'admin'

  def index
  	@vehicles = Vehicle.order("created_at DESC")
  	@vehicle_photos = VehiclePhoto.rank(:row_order).all
  end

  def show
  	@vehicle = Vehicle.friendly.find params[:id]
  	@vehicle_photos = @vehicle.vehicle_photos.rank(:row_order).all

  end

  def new
    @vehicle = Vehicle.new
    @vehicle_photo = @vehicle.vehicle_photos.build

  end

  def create
  	@vehicle = Vehicle.new(vehicle_params)
  	@vehicle_photos = @vehicle.vehicle_photos.all

  	  
  	    if params[:vehicle_photos].present?
  	    	respond_to do |format|
  	        if @vehicle.save 
  	  	      params[:vehicle_photos][:'file_name'].each do |a|
  	  		  @vehicle_photo = @vehicle.vehicle_photos.create!(:file_name => a, :vehicle_id => @vehicle_id)
  	  	      end
  	  	      format.html { redirect_to @vehicle, notice: 'Vehicle created.'}	
            else
              flash.now[:warning] = 'There were problems when trying to create a new vehicle'
              render :action => :new
            end
            end
        else
      	    if @vehicle.save 
              flash[:notice] = 'Vehicle created'
              render action: "show"
            else
              flash.now[:warning] = 'There were problems when trying to create a new vehicle'
              render :action => :new
            end
        end
   end

  def edit
  	@vehicle = Vehicle.friendly.find params[:id]
  	@vehicle_photos = @vehicle.vehicle_photos.rank(:row_order).all
  	respond_to do |format|
        format.html 
        format.json { render json: @vehicle_photos}
      end
  end

 def update
 	@vehicle = Vehicle.friendly.find params[:id]
 	@vehicle_photos = @vehicle.vehicle_photos.all
    if params[:vehicle_photos].present?
 	    if @vehicle.update_attributes vehicle_params
 		    params[:vehicle_photos][:'file_name'].each do |a|
  	  		    @vehicle_photo = @vehicle.vehicle_photos.create!(:file_name => a, :vehicle_id => @vehicle_id)
  	  	end
            flash[:notice] = 'Vehicle has been updated'
            render :action => :show
        else
            flash.now[:warning] = 'There were problems when trying to update this Vehicle'
            render :action => :edit
        end
    else
    	if @vehicle.update_attributes vehicle_params
            flash[:notice] = 'Vehicle has been updated'
            render :action => :show
        else
            flash.now[:warning] = 'There were problems when trying to update this Vehicle'
            render :action => :edit
        end
    end
 end

 def destroy
 	@vehicle = Vehicle.friendly.find params[:id]

 	@vehicle.destroy
      flash[:notice] = 'Vehicle Deleted'
      redirect_back fallback_location: root_path
 end

end


private


      
    def vehicle_params
      params.require(:vehicle).permit(:id, :title, :description, :make, :model, :year, :color, :sold, :type_of_vehicle, :price, vehicle_photos_attributes: [:id, :vehicle_id, :file_name, :row_order, :row_order_position])
    end