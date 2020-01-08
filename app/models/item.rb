class Item < ApplicationRecord
  validates :name, :price, presence: true

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :photos
  belongs_to :user
  # accepts_nested_attributes_for :photos
  # accepts_nested_attributes_for :photos, allow_destroy: true
end
