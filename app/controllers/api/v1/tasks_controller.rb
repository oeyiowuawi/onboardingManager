class Api::V1::TasksController < ApplicationController
  before_action :authenticate, only: [:update]

  def update
    task = current_employee.tasks.find(tasks_params[:id])
    update_task(task)
  end

  private

  def tasks_params
    params.permit(:done, :id)
  end

  def update_task(task)
    if task.update(done: tasks_params[:done])
      render json: { message: "succeffully Update Task" }, status: 200
    else
      render json: { errors: task.errors }, status: 422
    end
  end
end
