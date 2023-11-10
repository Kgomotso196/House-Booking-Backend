require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path '/api/v1/reservations' do
    get('list reservations') do
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   user_id: { type: :integer }, house_id: { type: :integer }, checking_date: { type: :string },
                   checkout_date: { type: :string }, city: { type: :string }, house_price: { type: :string }
                 },
                 required: %w[user_id house_id house_price checking_date checkout_date city]
               }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post 'creates a reservation' do
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer }, house_id: { type: :integer },
          city: { type: :string }, checking_date: { type: :string },
          checkout_date: { type: :string }, house_price: { type: :string }
        },
        required: %w[user_id house_id house_price checking_date checkout_date city]
      }

      response '201', 'Reservation' do
        let(:reservation) do # Change 'house' to 'reservation'
          {
            user_id: 1,
            house_id: 1,
            house_price: '1000',
            city: 'Paradise Island',
            checking_date: '20/11/2023',
            checkout_date: '20/11/2023'
          }
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:reservation) do # Change 'house' to 'reservation'
          {
            user_id: nil,
            house_id: nil,
            house_price: nil,
            city: nil,
            checking_date: nil,
            checkout_date: nil
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservation') do
      response(404, 'unsuccessful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    delete('delete house') do
      response(200, 'successful') do
        response('204', 'successful') do
          let(:id) { '123' }

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    end
  end
end
