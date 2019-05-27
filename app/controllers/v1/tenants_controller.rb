# frozen_string_literal: true

module V1
  # Tenants controller
  class TenantsController < ApplicationController
    before_action :set_occupant, only: :remove_from_property

    def create
      tenant = Tenant.create!(tenant_params)
      json_response(tenant, :created)
    end

    def add_to_property
      occupant = Occupant.create!(occupant_params)
      json_response(occupant, :created)
    end

    def remove_from_property
      @occupant.destroy
      head :no_content
    end

    private

    def tenant_params
      params.permit(:name)
    end

    def occupant_params
      params.permit(:property_id, :tenant_id)
    end

    def set_occupant
      @occupant = Occupant.find(params[:id])
    end
  end
end
