class AddBulkOrderIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :bulk_order_id, :bigint
  end
end
