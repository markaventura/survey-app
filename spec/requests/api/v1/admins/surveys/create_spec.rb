require 'rails_helper'

describe 'POST /api/v1/admins/surveys' do
  context 'when creating a survey using valid params' do
    def valid_params
      {
        name: 'Test Survey'
      }
    end

    it 'should be able to create a new survey' do
      auth_post '/api/v1/admins/surveys/', resource: valid_params

      expect(response_json['name']).to eql(valid_params[:name])
    end

    it 'should be able to create a new survey with slug' do
      auth_post '/api/v1/admins/surveys/', resource: valid_params
      
      expect(response_json['slug']).to eql('test-survey')
    end
  end

  context 'when creating a survey using invalid params' do
    def valid_params
      {
        name: ''
      }
    end

    it 'should be able to create a new survey' do
      auth_post '/api/v1/admins/surveys/', resource: valid_params

      expect(response_json['slug']).not_to be_empty
    end
  end
end
