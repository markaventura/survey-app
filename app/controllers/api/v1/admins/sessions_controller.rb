class Api::V1::Admins::SessionsController < ApiController

  skip_before_action :authenticate_request, only: :create

  def create
    obj = User.find_by_credentials(params[:resource])

    if obj.present? && obj.set_access_token
      render json: Sessions::Builder.new.basic_details(obj)
    else
      fail InvalidCredentialsError
    end
  end

  def destroy
    if current_user.destroy_token
      render_success
    else
      fail InvalidRequestError
    end
  end

end
