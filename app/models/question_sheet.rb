class QuestionSheet < ApplicationRecord
  belongs_to :exam_sheet
  belongs_to :question


  def marks
    if self.choosen_answer == self.question.right_answer
      return self.question.marks
    else
      return 0
    end
  end
end
