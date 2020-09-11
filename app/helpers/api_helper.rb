module ApiHelper
  def self.log_api_request(call_name, request_params, ip_address, is_successful)
    ApiRequest.new({
      call_name: call_name,
      request_params: request_params,
      ip_address: ip_address,
      is_successful: is_successful
    }).save
  end
end
