class ShareMailer < ApplicationMailer

  def send_share_link(exam_share, token)
    @exam_share = exam_share 
    @token = token
    @user = exam_share.exam.user
    @exam = exam_share.exam
    mail(:to => exam_share.email, :subject => "#{@user.username} shred an exam with you ")
  end

end
