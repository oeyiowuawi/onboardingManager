class Api::V1::SessionsController < ApplicationController

  before_action :authenticate, only: [:destroy]

  def create
    authenticator = Authenticator.new(email: sessions_params[:email],
                                     password: sessions_params[:password])
    if authenticator.valid?
      authenticator.login
      render json: { auth_token: authenticator.auth_token }, status: 200
    else
      render json: { error: "Bad email or password. Try again"}, status: 401
    end
  end

  def destroy
    authenticator = Authenticator.new(email: current_employee.email,
                                     password: current_employee.password)
    authenticator.logout

    render json: { message: "Successfully Logged out"}, status: 200
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
