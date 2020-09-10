class User
  include Mongoid::Document
  
  field :first_name, type: String
  field :last_name, type: String
  field :phone_number, type: String

  has_many :exam_windows
  belongs_to :exam
end
