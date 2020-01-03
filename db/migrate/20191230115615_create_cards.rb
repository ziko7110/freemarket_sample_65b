class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :number,null: false
      t.integer :expiration_date_month,null: false
      t.integer :expiration_date_year,null: false
      t.integer :security_code,null: false
      t.references :user,null: false
      t.timestamps
    end
  end
end
