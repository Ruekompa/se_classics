class VehiclesController < ApplicationController
	# before_action :authenticate_admin!
  def index
  	@vehicles = Vehicle.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
