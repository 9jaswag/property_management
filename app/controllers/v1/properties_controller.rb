# frozen_string_literal: true

module V1
  # Properties controller
  class PropertiesController < ApplicationController
    before_action :set_property, only: %i[show destroy update]

    def index
      properties = current_user.properties
      render json: properties, status: :ok
    end

    def create
      property = current_user.properties.create!(property_params)
      render json: property, status: :created
    end

    def show
      render json: @property, status: :ok
    end

    def update
      @property.update(property_params)
      head :no_content
    end

    def destroy
      @property.destroy
      head :no_content
    end

    private

    def property_params
      params.require(:property)
            .permit(unit_attributes: [:unit_type],
                    address_attributes: %i[street zipcode city state country])
    end

    def set_property
      @property = Property.find(params[:id])
    end
  end
end
