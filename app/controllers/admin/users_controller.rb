  class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user

  def index
    @users = User.preload(:tasks)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
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
    if @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_url, danger: t('.notice') }
        format.json { head :no_content }
      end
    else
      redirect_to admin_users_url, danger: t('.danger')
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

  def admin_user
    raise Forbidden unless current_user.admin?
  end

end
