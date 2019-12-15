class SessionsController < ApplicationController
  def new
    redirect_to user_path(@current_user.id) if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      if user.admin?
      redirect_to admin_users_path
      else
      redirect_to user_path(user.id)
      end
    else
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
