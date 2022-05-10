# frozen_string_literal: true

require 'swagger_helper'
RSpec.describe 'api/v1/reservations', type: :request do
  path '/api/v1/reservations' do
    parameter name: 'Authorization', in: :header, type: :string, description: 'bearer xyz'
    get('list reservations') do
      tags 'reservations'
      consumes 'application/json'
      response(401, 'return a list of all reservations') do
        let(:Authorization) { ' Bearer xyz' }
        run_test!
      end
      response(401, 'Invalid request') do
        let(:Authorization) { 'Bearer xyz' }
        run_test!
      end
    end
  end
  path '/api/v1/reservations/create' do
    parameter name: 'Authorization', in: :header, type: :string, description: 'bearer xyz'
    post 'Create a reservation' do
      tags 'reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          city: { type: :string },
          date: { type: :string },
          doctor_id: { type: :number }
        },
        required: %w[city date doctor_id]
      }
      response '401', 'reservation created' do
        let(:reservation) { { city: 'foo', date: '17-06-2025', doctor_id: 8 } }
        let(:Authorization) { 'Bearer abc' }
        run_test!
      end

      response '401', 'invalid request' do
        let(:reservation) { { city: 'foo', date: '17-06-2025', doctor_id: 8 } }
        let(:Authorization) { 'Bearer abc' }
        run_test!
      end
    end
  end
  path '/api/v1/reservations/delete' do
    parameter name: 'Authorization', in: :header, type: :string, description: 'bearer xyz'
    delete 'Delete a reservatio' do
      tags 'reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation_id: { type: :number }
        },
        required: %w[reservation_id]
      }
      response '401', 'reservation deleted' do
        let(:reservation) { { reservation_id: 8 } }
        let(:Authorization) { 'Bearer abc' }
        run_test!
      end

      response '401', 'invalid request' do
        let(:reservation) { { reservation_id: 8 } }
        let(:Authorization) { 'Bearer abc' }
        run_test!
      end
    end
  end
end
