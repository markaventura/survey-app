require 'rails_helper'

describe 'POST /api/v1/admins/questions' do
  context 'when creating a question using valid params' do

    let!(:survey) { create(:survey) }
    let!(:default_question_1) { create(:question, :default, survey: survey) }
    let!(:default_question_2) { create(:question, :default, survey: survey) }
    let!(:default_question_3) { create(:question, :default, survey: survey) }

    def valid_params
      {
        survey_id: survey.id,
        question: 'What is your favorite color?'
      }
    end

    it 'should be able to create a new question' do
      auth_post '/api/v1/admins/questions/', resource: valid_params
      
      expect(response_json['question']).to eql(valid_params[:question])
    end
  end

  context 'when creating more than 2 questions under a survey ' do

    let!(:survey) { create(:survey) }

    def valid_params
      {
        survey_id: survey.id,
        question: 'What is your favorite color?'
      }
    end

    it 'should be able to create a new question' do
      auth_post '/api/v1/admins/questions/', resource: valid_params
      auth_post '/api/v1/admins/questions/', resource: valid_params

      ## expect firs round of questions
      expect(response_json['question']).to eql(valid_params[:question])
      auth_post '/api/v1/admins/questions/', resource: valid_params

      expect(response_json['errors'].include?('Questions too much')).to eql true
    end
  end
end
