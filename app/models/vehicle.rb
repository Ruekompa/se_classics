class Vehicle < ApplicationRecord

  extend FriendlyId
  friendly_id :uniqueslug, use: :slugged

  def uniqueslug
    "#{year}-#{make}-#{model}"
  end


    has_many :vehicle_photos, dependent: :destroy

    accepts_nested_attributes_for :vehicle_photos
end
