class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :family_name_kanji
      t.string :first_name_kanji
      t.string :family_name_kana
      t.string :first_name_kana
      t.integer :postal_code
      t.string :prefecture
      t.string :city
      t.string :address_number 
      t.string :building_name
      t.string :phone_number
      t.references :user, null: false
      t.timestamps
      t.timestamps
    end
  end
end
