json.extract! order, :id, :pick_up, :drop_off, :weight, :sending_time, :created_at, :updated_at
json.url order_url(order, format: :json)
