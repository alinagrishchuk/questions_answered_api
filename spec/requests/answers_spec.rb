require 'rails_helper'

RSpec.describe '/answers', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Answer' do
        question = create(:question)

        expect do
          post answers_url,
               headers: Requests::JsonHelpers::HEADERS,
               params: build_jsonapi_parameters(attributes: { body: 'Body' },
                                                type: 'answers',
                                                relationships: build_relationships(type: 'questions', id: question.id))
        end.to change(Answer, :count).by(1)

        answer = Answer.last
        expect(answer.attributes).to include('question_id' => question.id, 'body' => 'Body')
      end

      it 'renders a JSON response with the new answer' do
        question = create(:question)

        post answers_url,
             headers: Requests::JsonHelpers::HEADERS,
             params: build_jsonapi_parameters(attributes: { body: 'Body' },
                                              type: 'answers',
                                              relationships: build_relationships(type: 'questions', id: question.id))

        expect(parsed_response_data['attributes']['body']).to eq('Body')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Answer' do
        expect do
          post answers_url,
               headers: Requests::JsonHelpers::HEADERS,
               params: build_jsonapi_parameters(attributes: { body: 'Body' },
                                                type: 'answers')
        end.to change(Answer, :count).by(0)
      end

      it 'renders a JSON response with errors for the new answer' do
        post answers_url,
             headers: Requests::JsonHelpers::HEADERS,
             params: build_jsonapi_parameters(attributes: { body: 'Body' },
                                              type: 'answers')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
