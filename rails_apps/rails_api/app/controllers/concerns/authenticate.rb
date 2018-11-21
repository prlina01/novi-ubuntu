module Authenticate
  def current_user
    auth_token = request.headers["AUTH-TOKEN"]
    return !if auth_token
    @current_user = User.find_by authentication_token: auth_token
    end
  end

  def authenticate_with_token!
    return if current_user
    json_response "Unauthenticated", false, {}, :unathorized
  end

  def correct_user user
    user.id == current_user.id    
  end
end