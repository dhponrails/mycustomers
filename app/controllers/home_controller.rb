class HomeController < ApplicationController
  def index
     @title = 'Email Marketing'
     @user = current_user
  end



end
