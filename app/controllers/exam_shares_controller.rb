class ExamSharesController < ApplicationController

  layout 'main_layout'

  def index
    exam = current_user.exams.find(params[:exam_id])
    @exam_shares = exam.exam_shares
    render :index
  end

  def new
    exam = current_user.exams.find(params[:exam_id])
    @exam_share = exam.exam_shares.build
    render :new
  end

  def create
    exam = current_user.exams.find(params[:exam_id])
    @exam_share = exam.exam_shares.build(exam_share_params)
    token = @exam_share.create_share_digest
    if @exam_share.email.present?
      ShareMailer.send_share_link(@exam_share, token).deliver_now
      render :plain => "Share link was send to your email"
    else
      render :plain => "Your share link is #{new_exam_exam_sheet_path(exam.id, :share => token, :share_id => @exam_share)}"
    end
  end


  def exam_share_params
    params.require(:exam_share).permit(:email)
  end

end
