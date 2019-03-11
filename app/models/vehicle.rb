class Vehicle < ApplicationRecord

  extend FriendlyId
  friendly_id :uniqueslug, use: :slugged

  def uniqueslug
    "#{year}-#{make}-#{model}"
  end

  def should_generate_new_friendly_id?
    year_changed? || super or
    make_changed? || super or
    model_changed? || super
   end

    has_many :vehicle_photos, dependent: :destroy

    accepts_nested_attributes_for :vehicle_photos
end
