json.array!(@feeds) do |feed|
  json.extract! feed, :id, :name, :slug
  json.url feed_url(feed, format: :json)
end
