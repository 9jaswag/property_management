# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::TenantsController, type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }
  let(:valid_attributes) { attributes_for(:tenant) }

  describe 'POST /tenants' do
    context 'when request is valid' do
      before { post '/tenants', params: valid_attributes.to_json, headers: headers }

      it 'creates a new tenant' do
        expect(response).to have_http_status(201)
        expect(json_body['name']).to eq(valid_attributes[:name])
      end
    end
  end
end
