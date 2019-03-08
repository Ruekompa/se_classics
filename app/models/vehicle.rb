class Vehicle < ApplicationRecord
    has_many :vehicle_photos

    accepts_nested_attributes_for :vehicle_photos
end
