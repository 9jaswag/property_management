# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { '235 Ikorodu Rd' }
    zipcode { '100252' }
    city { 'Illupeju' }
    state { 'Lagos' }
    country { 'Nigeria' }
  end
end
