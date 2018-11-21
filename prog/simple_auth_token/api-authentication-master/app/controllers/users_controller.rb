class UsersController < ApplicationController
  acts_as_token_authentication_handler_for User
  def show
    # user = User.find(params[:id])
    # if request.headers["X-user-email"] == User.find(params[:id]).email
    #   render json: user.as_json(only: [:username, :email]), status: :ok
    # else
    #   head(:unauthorized)
    # end
    user = User.find(params[:id])
    response = user.as_json(only: [:username, :email])

    user_authenticated? user.authentication_token, response
  end
end
