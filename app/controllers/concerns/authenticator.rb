module Authenticator
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= User.find_by_valid_token request_details
  end

  def request_details
    @request_details ||=
      {
        access_token: request.headers['AccessToken'] || params[:access_token] || request.headers['HTTP_ACCESS_TOKEN'] || request.headers['HTTP_AUTHORIZATION'],
        user_id: request.headers['UserId'] || params[:user_id]
      }
  end
  
  def authenticate_request
    fail ApiExceptions::ExpiredSessionError unless current_user.present?
  end

end