require 'rails_helper'

describe 'DELETE /api/v1/admins/sessions/:id' do

  let!(:user) { create(:user) }

  context 'when deleting a session' do
    it 'should be able to logout the user' do
      auth_delete "/api/v1/admins/sessions/#{user.id}"

      expect(response_json["success"]).to eql(true)
    end
  end
end

