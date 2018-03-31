json.extract! bill, :id, :identifier, :description, :vote_date, :result, :result_description, :institution_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
