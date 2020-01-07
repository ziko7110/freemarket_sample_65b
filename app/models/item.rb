class Item < ApplicationRecord
  validates :name, :price, presence: true
  belongs_to :user, optional: true
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  has_many :photos
  # accepts_nested_attributes_for :images, allow_destroy: true
end
