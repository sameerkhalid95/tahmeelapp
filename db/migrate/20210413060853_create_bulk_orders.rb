class CreateBulkOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :bulk_orders do |t|
      t.string :reference_number
      t.string :pick_up
      t.float :total_weight

      t.timestamps
    end
  end
end
