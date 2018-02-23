class ExamSheet < ApplicationRecord

  belongs_to :exam
  has_many :question_sheets

  accepts_nested_attributes_for :question_sheets

  def add_empty_sheet_questions
    self.exam.questions.each do |q|
      qs = self.question_sheets.build
      qs.question = q
    end
  end

  def result
    student_marks, total_marks = 0.0, 0.0

    self.question_sheets.each do |q|
      student_marks += q.marks
      total_marks += q.question.marks
    end
    return (student_marks / total_marks) * 100
   end

  def passed
    return  result  >= exam.pass_limit_percent
  end


end
