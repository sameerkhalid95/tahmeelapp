class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :pick_up
      t.string :drop_off
      t.float :weight
      t.datetime :sending_time

      t.timestamps
    end
  end
end
