  class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_path(@user.id), success: t('.notice') }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, danger: t('.notice') }
      format.json { head :no_content }
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
