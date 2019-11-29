class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.preload(:tasks)
  end

  def new
    if logged_in?
      redirect_to user_path(current_user.id), danger:"既にログインしています。"
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to admin_user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
      # if @user.id != current_user.id
      #   redirect_to user_path(current_user.id), danger:"権限がありません"
      # end
      @tasks = @user.tasks
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
