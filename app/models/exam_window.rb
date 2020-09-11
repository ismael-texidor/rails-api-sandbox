class ExamWindow
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :start_time, type: DateTime
  field :end_time, type: DateTime
  
  belongs_to :exams
end
