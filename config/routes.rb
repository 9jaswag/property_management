# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :properties do
      post 'occupants/:tenant_id', to: 'tenants#add_to_property'
      delete 'occupants/:id', to: 'tenants#remove_from_property'
    end
    resources :tenants, only: :create
  end

  post 'login', to: 'users#authenticate'
  post 'signup', to: 'users#create'
end
