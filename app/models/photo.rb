class Photo < ApplicationRecord
  mount_uploader :image, ImagesUploader
  belongs_to :item
end
