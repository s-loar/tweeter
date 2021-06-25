json.extract! tweet, :id, :message, :likes, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
