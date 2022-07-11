class HomeController < ApplicationController
  def index
    redirect_to articles_path if !@current_user
  end
end
