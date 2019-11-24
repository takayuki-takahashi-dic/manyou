class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :eunsure_logged_in?, only: [:show, :edit, :update, :destroy, :index, :new]
  include SearchHelper



  # GET /tasks
  def index
    sort_column = params[:column].presence || 'created_at'
    @tasks = Task.order(sort_column + ' ' + sort_direction)
                 .page(params[:page]).per(10)
                 .search(search_params)
    @search_params = search_params
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, success: t('.notice') }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, success: t('.notice') }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, danger: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :content, :deadline, :status, :priority)
    end

    def search_params
      params.permit(:title, :content, :deadline, :status, :priority)
    end

    def eunsure_logged_in?
      unless logged_in?
        redirect_to new_session_path, danger:"権限がありません"
      end

    end

end
