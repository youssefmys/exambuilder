class SessionsController < ApplicationController

  before_action :redirect_if_logged_in , :only => [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    if @user = authenticate_user(auth_params)
      sign_in(@user)
      redirect_to home_path , :flash => {:notice => "You've signed in successfully!"}
    else
      @user = User.new
      flash[:errors] = Array.new.push "Wrong username or password!"
      render :new
    end
  end

  def destroy
    if current_user.id == session[:user_id]
      sign_out
      redirect_to new_session_path
    else
      redirect_to home_path
    end
  end


  private

  def auth_params
    params.require(:user).permit(:username, :password)
  end

end
