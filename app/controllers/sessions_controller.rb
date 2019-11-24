class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_path(user.id)
    else
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
