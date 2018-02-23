class RegistrationsController < ApplicationController

  rescue_from CanCan::AccessDenied , :with => :user_not_authorized

  def index
    if can? :read, :user
      @users =  User.all
      render :index
    else
      raise CanCan::AccessDenied
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(registration_params)
    if @user.save
      sign_in(@user)
      token = @user.create_activation_digest
      UserMailer.account_activation_mail(@user, token).deliver_now
      redirect_to root_path, :flash => {:notice => "Activation link was sent to your account!"}
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def activate_account
    user = User.find(params[:id])
    if user.authenticate_token(activation_auth_params)
      user.update_attribute(:activated, true)
      render :plain => "You account was activated successfully!"
    else
      render :plain => "Invalid_link"
    end
  end

  private

  def registration_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

  def activation_auth_params
    params.permit(:activation)
  end

  private

    def user_not_authorized
      render :plain => 'Your are not authorized to access this page!'
    end

end
