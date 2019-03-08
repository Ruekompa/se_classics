class VehiclePhoto < ApplicationRecord
  include RankedModel
  ranks :row_order

  belongs_to :vehicle

  mount_uploader :file_name, VehiclePhotoUploader

  def calculated_row_order_position
  self.siblings.where('row_order < ?', self.row_order).count + 1
  end

end
