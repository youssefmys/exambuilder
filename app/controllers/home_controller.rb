class HomeController < ApplicationController

  before_action :authenticate_user!
  layout  'main_layout'

  def home
    render :home
  end

end
