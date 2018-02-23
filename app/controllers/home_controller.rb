class HomeController < ApplicationController

  before_action :authenticate_user!, :redirect_if_logged_in
  layout  'main_layout'

  def home

    render :home
  end

end
