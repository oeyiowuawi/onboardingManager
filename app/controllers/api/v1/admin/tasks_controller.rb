class Api::V1::Admin::TasksController < ApplicationController
  before_action :authenticate
  before_action :require_admin

  def create
    params = tasks_params.merge(created_by_id: current_employee.id, done: false)
    task = Task.new(params)
    if task.save
      render json: { message: "Successfully Created new task" }, status: 201
    else
      render json: { errors: task.errors }, status: 401
    end
  end

  private

  def tasks_params
    params.permit(:description, :employee_id, :due_date)
  end
end
