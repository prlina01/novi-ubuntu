class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end

  def user_authenticated? user_token, response
    if user_token == request.headers["X-user-token"]
      render json: response, status: :ok
    else
      head(:unauthorized)
    end
  end
end
