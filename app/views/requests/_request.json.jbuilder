json.extract! request, :id, :count, :request, :created_at, :updated_at
json.url request_url(history, format: :json)