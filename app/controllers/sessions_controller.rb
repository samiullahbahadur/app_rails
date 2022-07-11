class SessionsController < ApplicationController
  def new
    @user=User.new
  end
  def create
    user=User.find_by(email: params[:email])
     if user.present? && user.authenticate(params[:password])
       session[:user_id]=user.id
       redirect_to user_path(user), notice:" Successfully logged in"
     else
     flash.now[:danger]="There was something wrong with your login information"
      render :new
      end
  end
  def destroy
     session[:user_id]=nil
     redirect_to  root_path, notice:"Logged out"
  end
end
