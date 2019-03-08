class Vehicle < ApplicationRecord
    has_many :vehicle_photos, dependent: :destroy

    accepts_nested_attributes_for :vehicle_photos
end
