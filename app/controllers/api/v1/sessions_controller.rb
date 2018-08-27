class Api::V1::SessionsController < ApplicationController

  def create
    autenticator = Authenticator.new(sessions_params)
    if autenticator.valid?
      authenticator.login
      render json: { auth_token: autenticator.auth_token }, status: 200
    else
      render json: { error: "Bad email or password. Try again"}, status: 401
    end
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
