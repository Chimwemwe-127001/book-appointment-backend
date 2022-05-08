# frozen_string_literal: true

require 'swagger_helper'
RSpec.describe 'api/v1/doctors', type: :request do
  path '/api/v1/doctors' do
    parameter name: 'Authorization', in: :header, type: :string, description: 'bearer xyz'
    get('list doctors') do
      tags 'doctors'
      consumes 'application/json'
      response(200, 'return a list of all doctors') do
        let(:Authorization) { ' Bearer xyz' }
        run_test!
      end
      response(422, 'Invalid request') do
        let(:Authorization) { 'Bearer xyz' }
        run_test!
      end
    end
  end
  path '/api/v1/doctors/create' do
    parameter name: 'Authorization', in: :header, type: :string, description: 'bearer xyz'
    post 'Create a doctor' do
      tags 'doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          details: { type: :string },
          photo: { type: :string },
          city: { type: :string },
          specialization: { type: :string },
          cost: { type: :number }
        },
        required: %w[name details photo city specialization cost]
      }
      response '201', 'doctor created' do
        let(:doctor) { { name: 'foo', details: 'bar', photo: 'fo', city: 'bar', specialization: 'fo', cost: 20 } }
        let(:Authorization) { 'Bearer abc' }
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { name: 'foo', details: 'bar', photo: 'fo', city: 'bar', specialization: 'fo', cost: 20 } }
        let(:'X-Authorization') { 'Bearer abc' }
        run_test!
      end
    end
  end
  path '/api/v1/doctors/delete' do
    parameter name: 'Authorization', in: :header, type: :string, description: 'bearer xyz'
    delete 'Delete a doctor' do
      tags 'doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          doctor_id: { type: :number }
        },
        required: %w[doctor_id]
      }
      response '201', 'doctor deleted' do
        let(:doctor) { { doctor_id: 8 } }
        let(:Authorization) { 'Bearer abc' }
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { doctor_id: 8 } }
        let(:Authorization) { 'Bearer abc' }
        run_test!
      end
    end
  end
end
