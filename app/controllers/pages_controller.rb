class PagesController < ApplicationController

	def home
		@vehicles = Vehicle.order("created_at DESC").limit(6)
	end

end
