class Exam < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :exam_sheets
  has_many :exam_shares

  accepts_nested_attributes_for :questions

end
