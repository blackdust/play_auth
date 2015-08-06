module PlayAuth
  module SessionsHelper
    def log_in(user)
      session[:user_id] = user.id.to_s
    end

    def current_user
      @current_user ||= User.where(id: session[:user_id]).first unless session[:user_id].blank?
    end

    def logged_in?
      !!current_user
    end

    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
  end
end

