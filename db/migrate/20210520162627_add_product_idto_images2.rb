class AddProductIdtoImages2 < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :product_id, :integer
  end
end
