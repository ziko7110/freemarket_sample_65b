class AddCategorynameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :categoryname, :integer
  end
end
