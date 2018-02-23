class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    end

    if user.tutor?
      can :create, Exam
      can :create, ExamSheet
      can :create, Question
      can :create, QuestionSheet
      can [:read, :destroy, :update], Exam, :user_id => user.id

      can [:read, :destroy, :update], ExamSheet do |exam_sheet|
        exam_sheet.exam.user_id == user.id
      end

      can [:read, :destroy, :update], Question do |question|
           question.exam.user_id == user.id
      end

      can [:read, :destroy, :update], QuestionSheet do |question_sheet|
        question_sheet.exam_sheet.exam.user_id ==  user.id
      end

    end

  end

end
