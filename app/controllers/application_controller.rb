class ApplicationController < ActionController::Base
  rescue_from AutenticationError, with: :expired_token
  rescue_from InvalidTokenError, with: :invalid_token

  protected

  def authenticate
    employee_id = decoded_auth_token[:employee_id]
    employee = Employee.find(employee_id)
    raise AutenticationError unless employee.status
    @current_user = employee
  end

  def expired_token
    render json: { error: "Token expired, try to authenticate again" },
           status: 401
  end

  def invalid_token
    render json: { error: "The token you supplied is not valid." }, status: 401
  end

  def decoded_auth_token
    @decoded_auth_token ||= AuthToken.decode(http_auth_token)
  end

  def http_auth_token
    @http_auth_token ||= if request.headers["Authorization"].present?
                           request.headers["Authorization"].split(" ").last
                         end
  end

end
