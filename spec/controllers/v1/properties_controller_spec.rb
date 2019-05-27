# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::PropertiesController, type: :request do
  let(:user) { create(:user) }
  let(:unit) { create(:unit) }
  let(:address) { create(:address) }
  let!(:property) { create(:property, unit: unit, address: address, user: user) }
  let(:property_id) { user.properties.first.id }
  let(:headers) { valid_headers }
  let(:valid_attributes) do
    {
      property: {
        unit_attributes: { unit_type: 'Duplex' },
        address_attributes: {
          street: '123, Ichiraku street',
          zipcode: '12345',
          city: 'Uchiha',
          state: 'Konohagakure',
          country: 'Land of Fire'
        }
      }
    }.to_json
  end
  let(:invalid_attributes) do
    {
      property: {
        unit_attributes: { unit_type: 'Duplex' }
      }
    }.to_json
  end

  describe 'GET /properties' do
    context 'when request is valid' do
      before { get '/properties', headers: headers }

      it 'returns all user\'s property' do
        expect(response).to have_http_status(200)
        expect(json_body.first).to have_key('address')
        expect(json_body.first).to have_key('unit')
        expect(json_body.first['address']['street']).to eq address.street
        expect(json_body.first['unit']['unit_type']).to eq unit.unit_type
      end
    end
  end

  describe 'POST /properties' do
    context 'when request is valid' do
      before { post '/properties', params: valid_attributes, headers: headers }

      it 'creates a new property' do
        expect(response).to have_http_status(201)
        expect(json_body['address']['street']).to eq(
          JSON.parse(valid_attributes)['property']['address_attributes']['street']
        )
      end
    end

    context 'when request is invalid' do
      before { post '/properties', params: invalid_attributes, headers: headers }

      it 'returns an error message' do
        expect(response).to have_http_status(422)
        expect(json_body['message']).to match(/Validation failed: Address must exist/)
      end
    end
  end

  describe 'GET /properties/:id' do
    context 'when request is valid' do
      before { get "/properties/#{property_id}", headers: headers }

      it 'returns the requested property' do
        expect(response).to have_http_status(200)
        expect(json_body).to have_key('address')
        expect(json_body).to have_key('unit')
        expect(json_body['address']['street']).to eq address.street
        expect(json_body['unit']['unit_type']).to eq unit.unit_type
      end
    end
  end

  describe 'PATCH /properties/:id' do
    context 'when request is valid' do
      updated_attributes = {
        property: {
          unit_attributes: { unit_type: 'Condo' }
        }
      }.to_json

      before do
        patch "/properties/#{property_id}",
              params: updated_attributes,
              headers: headers
      end

      it 'updates the requested property' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /properties/:id' do
    context 'when request is valid' do
      before { delete "/properties/#{property_id}", headers: headers }

      it 'deletes the requested property' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
