require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :authorize_request

    def index
      render json: { message: 'Success' }, status: :ok
    end
  end

  let!(:user) { create(:user) }
  let(:headers) { { 'Authorization' => JsonWebToken.encode(user_id: user.id) } }

  describe 'authorization' do
    context 'with valid token' do
      it 'allows access' do
        request.headers.merge!(headers)
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid token' do
      it 'denies access' do
        request.headers['Authorization'] = 'invalid_token'
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
