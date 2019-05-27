# frozen_string_literal: true

module V1
  # Tenants controller
  class TenantsController < ApplicationController
    def create
      tenant = Tenant.create!(tenant_params)
      json_response(tenant, :created)
    end

    

    private

    def tenant_params
      params.permit(:name)
    end
  end
end
