class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.integer :uid,null: false
      t.string :provider,null: false
      t.string :provider,null: false
      t.text :token
      t.references :user_id,null: false
      t.timestamps
    end
  end
end
