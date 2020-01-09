class Brand < ApplicationRecord
  belongs_to :item
  validates :brandname, presence: true
end
