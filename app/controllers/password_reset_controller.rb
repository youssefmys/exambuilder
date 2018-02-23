class PasswordResetController < ApplicationController

  before_action :redirect_if_logged_in, :only => [:new]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_link
  layout "main_layout"

  def new
    render :new
  end

  def create
    if user = User.find_by(:email => params[:email])
      token = user.create_password_reset_digest
      UserMailer.reset_password_mail(user, token).deliver_now
      render :reset_password_message_page 
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.authenticate_token(auth_params)
      render :edit
    else
      render :plain => "Nothing to show here"
    end
  end

  def update

    @user = User.find(params[:id])
    if @user.update(password_update_params)
      render :plain => "Your password was reset successfully!"
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end

  end
  private

  def auth_params
    params.permit(:password_reset)
  end

  def password_update_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def invalid_link
    render :plain => 'invalid link'
  end

end
