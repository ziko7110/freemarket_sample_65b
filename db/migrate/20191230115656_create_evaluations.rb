class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :user,null: false
      t.text :comment
      t.timestamps
    end
  end
end
