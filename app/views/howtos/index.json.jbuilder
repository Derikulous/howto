json.array!(@howtos) do |howto|
  json.extract! howto, :name, :description
  json.url howto_url(howto, format: :json)
end
