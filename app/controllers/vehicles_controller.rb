class VehiclesController < ApplicationController
	# before_action :authenticate_admin!
  def index
  	@vehicles = Vehicle.all
  end

  def show
  	@vehicle = Vehicle.find params[:id]
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
  	@vehicle = Vehicle.new(vehicle_params)

  	  if @vehicle.save 
        flash[:notice] = 'Vehicle created'
        render action: "show"
      else
        flash.now[:warning] = 'There were problems when trying to create a new vehicle'
        render :action => :new
      end
  end

  def edit
  	@vehicle = Vehicle.find params[:id]
  end

 def update
 	@vehicle = Vehicle.find params[:id]

 	if @vehicle.update_attributes vehicle_params
        flash[:notice] = 'Vehicle has been updated'
        render :action => :show
      else
        flash.now[:warning] = 'There were problems when trying to update this Vehicle'
        render :action => :edit
      end
 end

 def destroy
 	@vehicle = Vehicle.find params[:id]

 	@album.destroy
      flash[:notice] = 'Vehicle Deleted'
      render :action => :index
 end

end


private


      
    def vehicle_params
      params.require(:vehicle).permit(:id, :title, :description, :make, :model, :year, :color, :sold, :type_of_vehicle)
    end