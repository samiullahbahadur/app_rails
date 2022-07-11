class ApplicationController < ActionController::Base

   # helper_method :current_user, :logged_in?

    #def current_user
     # @current_user ||=  User.find(session[:user_id]) if session[:user_id]
   # end
    #def logged_user
        #!!current_user
   # end
    #def require_user
       # if !logged_in?
         #   flash[:danger]="You must be logged in to perform that action"
          #  redirect_to root_path
       # end
    #end
    before_action  :set_current_user
    def set_current_user
        if session[:user_id]
            @current_user=User.find_by(id: session[:user_id])
          end
    end

    def require_user_logged_in
        redirect_to  root_path, alert:"You must be signed in  to that." if @current_user.nil?
    end

end
