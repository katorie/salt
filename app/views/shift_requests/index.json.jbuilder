json.array!(@shift_requests) do |shift_request|
  json.extract! shift_request, :id
  json.url shift_request_url(shift_request, format: :json)
end
