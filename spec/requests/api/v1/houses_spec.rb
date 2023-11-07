require 'swagger_helper'

RSpec.describe 'api/v1/houses', type: :request do
  path '/api/v1/houses' do
    get('list houses') do
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   user_id: { type: :integer },
                   location: { type: :string },
                   description: { type: :string },
                   house_image: { type: :string },
                   house_name: { type: :string }
                 },
                 required: %w[user_id house_name description location house_image]
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

    post 'Creates a house' do
      consumes 'application/json'
      parameter name: :house, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          location: { type: :string },
          description: { type: :string },
          house_image: { type: :string },
          house_name: { type: :string }
        },
        required: %w[user_id house_name description location house_image]
      }

      response '201', 'House' do
        let(:house) do
          {
            user_id: 1,
            house_name: 'Beautiful Beachfront Villa',
            house_image: 'beachfront.jpg',
            location: 'Paradise Island',
            description: 'A stunning beachfront villa with breathtaking views of the ocean.'
          }
        end
        run_test!
      end
    end
  end
end
