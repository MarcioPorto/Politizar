json.extract! subscriber, :id, :name, :email, :region_id, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)
