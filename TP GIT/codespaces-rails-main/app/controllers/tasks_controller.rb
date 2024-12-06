class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'La tarea fue creada con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end
  
  private
  def task_params
    params.require(:task).permit(:title, :completed)
  end
end

