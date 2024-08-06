# frozen_string_literal: true

# Manage Tasks
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def set_task
    @task = Task.find(params[:id])
  end

  # --------------------------------------------------------

  def index
    @tasks = Task.all
  end

  def show
    # before_action (set_task)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    # before_action (set_task)
  end

  def update
    # before_action (set_task)
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    # before_action (set_task)
    Task.delete(@task)

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
