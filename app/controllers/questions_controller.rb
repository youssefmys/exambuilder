class QuestionsController < ApplicationController

  load_and_authorize_resource

  def create
    @exam = current_user.exams.find(params[:exam_id])
    question = @exam.questions.build
    question.save(:validate => false)
    redirect_to exam_path(@exam)
  end

  def destroy
    @exam = current_user.exams.find(params[:exam_id])
    Question.delete(params[:id])
    redirect_to exam_path(@exam)
  end


end
