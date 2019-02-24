class Vehicle < ApplicationRecord
		mount_uploaders :vehicle_photos, VehiclePhotoUploader
end
