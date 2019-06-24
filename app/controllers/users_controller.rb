class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  include Response
  include ExceptionHandler

  def create
    user = User.create!(user_params)
    generate_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, token: generate_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
