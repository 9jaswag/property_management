# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    user = User.create!(user_params)
    token = AuthenticateUser.new(user.email, user.password).call
    response = { message: 'Account created successfully', token: token }

    render json: response, status: :created
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
