class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brandname
      t.references :item
      t.timestamps
    end
  end
end
