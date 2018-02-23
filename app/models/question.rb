class Question < ApplicationRecord
#  before_validation  :set_answer_hash
#  attr_writer    :first_answer, :second_answer,:third_answer, :fourth_answer
#
#  @@answer_attributes = [:first_answer, :second_answer, :third_answer, :fourth_answer]


  #validations
  validate :answers_are_valid
  validates_presence_of :title, :marks

  #associations
  belongs_to :exam
  has_many :question_sheets

private

def answers_are_valid
    filled_answers_count = 0
    [:first_answer, :second_answer, :third_answer, :fourth_answer].each do |a|
      filled_answers_count += 1 if !self.send(a).blank?
    end
    errors.add(:base, "Two answers at least should be provided") if filled_answers_count <= 1
end

#  def self.create_answer_methods
#    @@answer_attributes.each do |m|
#      define_method m do
#        get_answer_hash[m]
#      end
#    end
#  end
#
#  create_answer_methods

#  private

#  def set_answer_hash
#
#    answer_hash = {
#      :first_answer   => @first_answer ,
#      :second_answer  => @second_answer ,
#      :third_answer   => @third_answer ,
#      :fourth_answer  => @fourth_answer ,
#    }
#    self.answer = answer_hash.to_s
#  end
#
#
#
#  def get_answer_hash
#    set_answer_hash if answer.nil?
#    hash = {}
#    answer.gsub(/[\{\}\"\:]/, "").split(', ').each do |e|
#      key, value = e.split('=>')
#      value == "nil" ?  hash[key.to_sym] =  nil : hash[key.to_sym] =  value
#    end
#    return hash
#  end
#
#  def answers_are_valid
#    get_answer_hash.each do |key, value|
#      if value.nil?
#        self.errors[key] << "Can't be blank"
#      end
#    end
#  end

end
