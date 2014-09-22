json.array!(@uploads) do |upload|
  json.extract! upload, :id, :title, :file, :desciption
  json.url upload_url(upload, format: :json)
end
