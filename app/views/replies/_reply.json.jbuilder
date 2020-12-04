json.extract! reply, :id, :text, :created_at, :updated_at
json.url reply_url(reply, format: :json)
