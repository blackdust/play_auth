class PlayAuth::SessionsController < PlayAuth::ApplicationController
  include PlayAuth::SessionsHelper

  def new
  end

  def create
    user = User.where(email: params[:session][:email]).first
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, notice: 'login successfully'
    else
      flash[:danger] = 'Invalid email/password combination' # 不完全正确
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
