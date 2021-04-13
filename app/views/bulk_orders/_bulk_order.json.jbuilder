json.extract! bulk_order, :id, :reference_number, :pick_up, :total_weight, :created_at, :updated_at
json.url bulk_order_url(bulk_order, format: :json)
