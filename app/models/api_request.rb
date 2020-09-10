class ApiRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :call_name, type: String
  field :request_body, type: Hash
  field :ip_address, type: String
  field :is_successful, type: Boolean
end
