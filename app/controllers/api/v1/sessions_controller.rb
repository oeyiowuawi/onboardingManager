class Api::V1::SessionsController < ApplicationController

  def create
    autenticator = Authenticator.new(sessions_params)
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
