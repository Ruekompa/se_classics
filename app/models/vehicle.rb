class Vehicle < ApplicationRecord
		mount_uploader :vehicle_photo, VehiclePhotoUploader
end
