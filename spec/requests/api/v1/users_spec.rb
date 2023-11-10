require 'swagger_helper'

RSpec.describe 'api/v1/sessions', type: :request do
  path '/api/v1/sessions' do
    post('A new user session') do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user_name: { type: :string }

        },
        required: ['user_name']
      }

      response '201', 'user created' do
        let(:user) { { user_name: 'foo' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end
  end
end
