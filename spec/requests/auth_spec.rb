require 'rails_helper'

RSpec.describe AuthController, type: :controller do
  let!(:user) { create(:user) }
  let(:valid_credentials) { { email: user.email, password: user.password } }
  let(:invalid_credentials) { { email: 'wrong', password: 'wrong' } }

  describe 'POST #login' do
    context 'with valid credentials' do
      it 'returns an auth token' do
        post :login, params: valid_credentials
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid credentials' do
      it 'returns an unauthorized status' do
        post :login, params: invalid_credentials
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST #register' do
    let(:user_params) { attributes_for(:user) }

    context 'with valid params' do
      it 'creates a new user and returns an auth token' do
        post :register, params: user_params
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid params' do
      it 'returns an unprocessable entity status' do
        post :register, params: { email: '', password: '' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
