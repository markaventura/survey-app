require 'rails_helper'

describe 'GET /api/v1/admins/surveys/:id' do
  context 'when getting survey using slug' do
    let!(:survey) { create(:survey) }
    let!(:question_1) { create(:question, survey: survey) }
    let!(:question_2) { create(:question, survey: survey) }

    let!(:question_response) { create(:response, survey: survey) }
    let!(:response_question_1) { create(:response_question, question: 'foo', response: question_response, question_id: question_1.id) }
    let!(:response_question_2) { create(:response_question, question: 'bar', response: question_response, question_id: question_2.id) }


    it 'should be able get survey including questions' do
      auth_get "/api/v1/admins/surveys/#{survey.slug}"

      expect(response_json['slug']).to eql(survey.slug)
      expect(response_json['questions'].size).to eql(2)
    end
  end
end
