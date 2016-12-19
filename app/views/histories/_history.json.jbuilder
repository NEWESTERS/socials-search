json.extract! history, :id, :owner, :request, :created_at, :updated_at
json.url history_url(history, format: :json)