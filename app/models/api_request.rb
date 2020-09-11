class ApiRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :call_name, type: String
  field :request_params, type: String
  field :ip_address, type: String
  field :is_successful, type: Boolean
  field :error_message, type: String
end
