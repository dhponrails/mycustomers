class HomeController < ApplicationController
  def index
     @title = 'Bay Web Soft Marketing'
     @user = current_user
  end



end
