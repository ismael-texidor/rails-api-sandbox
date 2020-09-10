class College
  include Mongoid::Document
  
  field :name, type: String
  # override mongoid BSON ids
  field :_id, as: :college_id, type: Integer, default: -> { College.count + 1 }

  has_many :exams
end
