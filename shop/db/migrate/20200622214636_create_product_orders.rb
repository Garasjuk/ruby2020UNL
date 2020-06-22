class CreateProductOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :product_orders do |t|
      t.integer :quantity
      t.references :products, null: false, foreign_key: true
      t.references :orders, null: false, foreign_key: true

      t.timestamps
    end
  end
end
