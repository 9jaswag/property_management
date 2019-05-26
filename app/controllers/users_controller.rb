# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  skip_before_action :authorize_request, only: %i[create authenticate]

  def create
    user = User.create!(user_params)
    token = AuthenticateUser.new(user.email, user.password).call
    response = { message: 'Account created successfully', token: token }

    json_response(response, :created)
  end

  def authenticate
    token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(token: token)
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def auth_params
    params.permit(:email, :password)
  end
end
