class Exam
  include Mongoid::Document
  
  field :name, type: String
  field :_id, as: :exam_id, type: Integer, default: -> { Exam.count + 1 }

  has_many :users
  belongs_to :college


end
