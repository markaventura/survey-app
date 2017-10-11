require 'rails_helper'

describe 'POST /api/v1/responses' do
  context 'when creating a response using valid params' do
    let!(:survey) { create(:survey) }
    let!(:question_one) { create(:question, survey: survey) }
    let!(:question_two) { create(:question, survey: survey) }

    def valid_params
      first_default_question = DefaultQuestion.all[0]
      second_default_question = DefaultQuestion.all[0]
      third_default_question = DefaultQuestion.all[0]

      {
        name: survey.name,
        survey_id: survey.id,
        respondent_name: Faker::Name.name,
        questions: [
          {
            id: question_one.id,
            question: question_one.question,
            answer: 'foo',
            default_question: true
          },
          {
            id: question_two.id,
            question: question_two.question,
            answer: 'bar',
            default_question: false
          }
        ]
      }
    end

    it 'should be able to create a new survey' do
      params = valid_params

      auth_post '/api/v1/responses', resource: params

      question_response = Response.find(response_json['id'])

      expect(response_json['respondent_name']).to eql(params[:respondent_name])
      expect(question_response.response_questions.size).to eql(2)
    end
  end
end
