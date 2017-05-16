class SessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    json = Api::V2::CompleteUserSerializer.new(current_api_user).as_json
    render json: json
  end
end