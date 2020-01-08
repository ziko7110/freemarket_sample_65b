class Item < ApplicationRecord
  validates :name, :price, presence: true
  belongs_to :user
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :photos, dependent: :destroy
  # accepts_nested_attributes_for :images, allow_destroy: true
end
