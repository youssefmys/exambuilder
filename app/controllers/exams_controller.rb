class ExamsController < ApplicationController

  layout 'main_layout'

  load_and_authorize_resource
  rescue_from ActiveRecord::RecordNotFound , :with => :exam_not_found
  rescue_from CanCan::AccessDenied, :with => :user_not_authorized

  def index
    @exams = current_user.exams
    render :index
  end

  def new
    @exam = current_user.exams.build
    render :new
  end

  def create
    @exam = current_user.exams.build(exam_params)
    if @exam.valid?
      current_user.exams << @exam
      redirect_to exam_path(@exam)
    else
      flash[:errors] =  @exam.errors.full_messages
      render :new
    end
  end

  def show
    @exam = current_user.exams.find(params[:id])
    render :show
  end

  def edit
    @exam = current_user.exams.find(params[:id])
    render :edit
  end

  def update
    @exam = current_user.exams.find(params[:id])
    if @exam.update(exam_params)
      redirect_to exam_path(@exam), :flash => {:notice => "Exam was updated successfully" }
    else
      flash[:errors] = @exam.errors.full_messages
      render :show
    end
  end

  def destroy
    exam = current_user.exams.find(params[:id])
    Exam.delete(exam.id)
    redirect_to exams_path
  end


  private

  def exam_params
    params.require(:exam).permit(:title, :allowed_time_in_minutes, :questions_attributes =>
      [:title, :first_answer, :second_answer, :third_answer,
       :fourth_answer, :id, :marks, :right_answer])
  end

  def exam_not_found
    return head(:forbidden)
  end

  def user_not_authorized
    render :plain => "You are not authorized to access this page!"
  end

  def share_params
    params.allow(:email, :exam_id)
  end

end
