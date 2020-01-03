class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :family_name_kanji, null: false
      t.string :first_name_kanji, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :address_number, null: false
      t.string :building_name
      t.integer :phone_number
      t.references :user, null: false
      t.timestamps
      t.timestamps
    end
  end
end
