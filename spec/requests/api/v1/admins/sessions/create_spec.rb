require 'rails_helper'

describe 'POST /api/v1/admins/sessions' do
  context 'when creating a session using valid params' do
    def valid_params
      {
        email: 'admin@survey.com',
        password: 'password'
      }
    end

    it 'should be able to log in' do
      auth_post '/api/v1/admins/sessions/', resource: valid_params

      expect(response_json['obj']['email']).to eql(valid_params[:email])
    end

    it 'should be able to get access token' do
      auth_post '/api/v1/admins/sessions/', resource: valid_params

      expect(response_json['access_token']).not_to be_empty
    end
  end


  context 'when creating a session using invalid params' do
    def invalid_params
      {
        email: 'admintest@survey.com',
        password: 'password'
      }
    end

    it 'should not be able to log in' do
      auth_post '/api/v1/admins/sessions/', resource: invalid_params

      expect(response_json['error']).to eql("Your email and password don't match")
    end
  end
end
