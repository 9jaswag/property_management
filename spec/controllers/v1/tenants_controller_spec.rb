# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::TenantsController, type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }
  let(:valid_attributes) { attributes_for(:tenant) }
  let(:tenant) { create(:tenant) }
  let(:unit) { create(:unit) }
  let(:address) { create(:address) }
  let!(:property) { create(:property, unit: unit, address: address, user: user) }
  let!(:property_2) { create(:property, unit: unit, address: address, user: user) }
  let!(:occupant) { create(:occupant, tenant: tenant, property: property) }

  describe 'POST /tenants' do
    context 'when request is valid' do
      before { post '/tenants', params: valid_attributes.to_json, headers: headers }

      it 'creates a new tenant' do
        expect(response).to have_http_status(201)
        expect(json_body['name']).to eq(valid_attributes[:name])
      end
    end
  end

  describe 'POST /properties/:property_id/occupants/:tenant_id' do
    context 'when request is valid' do
      before { post "/properties/#{property_2.id}/occupants/#{tenant.id}", headers: headers }

      it 'creates a new property occupant' do
        expect(response).to have_http_status(201)
        expect(json_body).to have_key('property')
        expect(json_body).to have_key('tenant')
        expect(json_body['tenant']['name']).to eq tenant.name
      end
    end
  end

  describe 'DELETE /properties/:property_id/occupants/:id' do
    context 'when request is valid' do
      before { delete "/properties/#{property.id}/occupants/#{occupant.id}", headers: headers }

      it 'removes the property\'s tenant' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
