class Api::V1::SessionsController < ApplicationController

  def create
    autenticator = Authenticator.new(sessions_params)
    if autenticator.valid?
      render json: { auth_token: autenticator.auth_token }, status: 200
    else

    end
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
