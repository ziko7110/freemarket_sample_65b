class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.references :user_id,null: false
      t.text :description
      t.integer :category,null: false
      t.integer :condition,null: false
      t.integer :delivery_fee,null: false
      t.integer :delivery_method,null: false
      t.integer :shipping_area,null: false
      t.integer :shipping_days,null: false
      t.integer :price,null: false
      t.timestamps
    end
  end
end
