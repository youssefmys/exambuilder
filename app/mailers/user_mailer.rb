class UserMailer < ApplicationMailer

  default :from => "tutoryoussef@gmail.com"

  def reset_password_mail(user, password_reset_token)
    @user = user
    @token = password_reset_token
    mail(:to => @user.email , :subject => "Password reset")
  end

  def account_activation_mail(user, account_activation_token)
    @user = user
    @token = account_activation_token
    mail(:to => @user.email, :subject => "Account activation")
  end

end
