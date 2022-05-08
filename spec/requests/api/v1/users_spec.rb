# frozen_string_literal: true

require 'swagger_helper'
RSpec.describe 'api//v1/users', type: :request do
  path '/api/v1/users' do
    post 'Sign up' do
      tags 'users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          client_id: { type: :string }
        },
        required: %w[name email password client_id]
      }
      response '201', 'Sign up successfull with returned access token' do
        let(:user) { { name: 'Tom', email: 'email@example.com', password: '123456', client_id: 'xyz' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:user) { { name: 'Tom', email: 'email@example.com', password: '123456', client_id: 'xyz' } }
        run_test!
      end
    end
  end
  path '/api/v1/users/aouth/token' do
    post 'Sign in' do
      tags 'users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          grant_type: { type: :string },
          email: { type: :string },
          password: { type: :string },
          client_id: { type: :string },
          client_secret: { type: :string }
        },
        required: %w[email password grant_type client_id client_secret]
      }
      response '201', 'Sign in successfull with returned access token' do
        let(:user) do
          { grant_type: 'password', email: 'email@example.com', password: '123456', client_id: 'xyz',
            client_secret: 'xyz' }
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:user) do
          { grant_type: 'password', email: 'email@example.com', password: '123456', client_id: 'xyz',
            client_secret: 'xyz' }
        end
        run_test!
      end
    end
  end
end
