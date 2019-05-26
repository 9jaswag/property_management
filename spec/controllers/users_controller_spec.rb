# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  describe 'POST /signup' do
    context 'when request is valid' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json_body['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json_body['token']).not_to be_nil
      end
    end

    context 'when request is invalid' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json_body['message']).to include 'Validation failed:'
        expect(json_body['message']).to include 'Password can\'t be blank'
        expect(json_body['message']).to include 'Name can\'t be blank'
        expect(json_body['message']).to include 'Email can\'t be blank'
        expect(json_body['message']).to include 'Email is invalid'
        expect(json_body['message']).to include 'Password digest can\'t be blank'
      end
    end
  end

  describe 'POST /login' do
    let!(:user) { create(:user) }
    let(:headers) { valid_headers.except('Authorization') }
    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }.to_json
    end
    let(:invalid_credentials) do
      {
        email: 'janedoe@email.com',
        password: 'simplepass'
      }.to_json
    end

    context 'When request is valid' do
      before { post '/login', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json_body['token']).not_to be_nil
      end
    end

    context 'When request is invalid' do
      before { post '/login', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json_body['message']).to match(/Invalid credentials/)
      end
    end
  end
end
