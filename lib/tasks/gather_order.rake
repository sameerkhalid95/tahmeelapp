namespace :gather do
  desc 'gater all the orders for the day'
  task orders: [:environment] do
    Order::PICK_UP_LOCATIONS.each do |pick_up|
      orders = Order.filter_by_pick_up_and_date(pick_up, Date.tomorrow)
      unless orders.count.zero?
        b = BulkOrder.create(pick_up: pick_up, total_weight: orders.sum(:weight))
        b.orders = orders
        b.save!
      end
    end
  end
end
