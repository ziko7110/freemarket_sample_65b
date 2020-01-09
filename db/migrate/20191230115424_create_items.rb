class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.references :user
      t.text :description
      t.integer :condition
      t.integer :delivery_fee
      t.integer :delivery_method
      t.integer :shipping_area
      t.integer :shipping_days
      t.integer :price
      t.integer :brand
      t.integer :buyer_id
    end
  end
end
