class AuthenticationController < ApplicationController
  def authenticate
    headers['Access-Control-Allow-Origin'] = '*'
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result[:token], name: command.result[:name], email: command.result[:email] }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end