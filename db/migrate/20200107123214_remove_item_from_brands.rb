class RemoveItemFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_reference :brands, :item, foreign_key: true
  end
end
