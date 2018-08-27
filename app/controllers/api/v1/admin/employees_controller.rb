class Api::V1::Admin::EmployeesController < ApplicationController

  before_action :authenticate
  before_action :require_admin

  def create
    new_employee = Employee.new(employee_params)
    if new_employee.save
      render json: { message: "Successfully Created new employee" }, status: 201
    else
      render json: { errors: new_employee.errors }, status: 422
    end
  end

  private

  def employee_params
    params.permit(:email, :department_id, :name, :password)
  end
end
