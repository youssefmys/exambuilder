class HomeController < ApplicationController

  before_action :authenticate_user!
  layout  'main_layout'

  def home
    if !logged_in?
      redirect_to new_session_path 
    end
      render :home
  end

end
