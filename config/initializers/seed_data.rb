module SeedData
  def self.create_data
    if College.count == 0
      college = College.new({name:'Test College'})
      exam = Exam.new({name: 'Test Exam'})
      exam1 = Exam.new({name: 'Test Exam1'})
      user = User.new({first_name: 'Ish', last_name: 'test', phone_number: 'number'})
      user.save
      exam_window = ExamWindow.new({start_time: Time.new(2018, 1, 1), end_time: Time.new(2021, 1, 1)})
      exam_window.save
      exam.exam_windows << exam_window
      exam.users << user
      exam1.exam_windows << exam_window
      exam1.users << user
      exam.save
      exam1.save
      college.exams << exam
      college.exams << exam1
      college.save
    end
  end
end

SeedData.create_data