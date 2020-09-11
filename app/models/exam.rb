class Exam
  include Mongoid::Document
  
  field :name, type: String

  # override mongoid BSON ids
  field :_id, as: :exam_id, type: Integer, default: -> { Exam.count + 1 }

  has_and_belongs_to_many :users
  has_many :exam_windows, autosave: true
  belongs_to :college 
end
