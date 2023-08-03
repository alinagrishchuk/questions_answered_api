require 'rails_helper'
RSpec.describe '/questions', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      question = create(:question)

      get questions_path

      expect(response).to be_successful
      expect(parsed_response_data.length).to eq(1)
      expect(parsed_response_data[0]['id']).to eq(question.id.to_s)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      question = create(:question, title: 'Title')

      get question_url(question)

      expect(response).to be_successful
      expect(parsed_response_data['id']).to eq(question.id.to_s)
      expect(parsed_response_data['attributes']['title']).to eq('Title')
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Question' do
        expect do
          post questions_url,
               headers: Requests::JsonHelpers::HEADERS,
               params: build_jsonapi_parameters({ "title": 'Title', "body": 'Body' }, 'questions')
        end.to change(Question, :count).by(1)

        question = Question.last
        expect(question.attributes).to include('title' => 'Title', 'body' => 'Body')
      end

      it 'renders a JSON response with the new question' do
        post questions_url,
             headers: Requests::JsonHelpers::HEADERS,
             params: build_jsonapi_parameters({ "title": 'Title', "body": 'Body' }, 'questions')

        expect(parsed_response_data['attributes']['title']).to eq('Title')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Question' do
        expect do
          post questions_url,
               headers: Requests::JsonHelpers::HEADERS,
               params: build_jsonapi_parameters({ "title": 'title' }, 'questions')
        end.to change(Question, :count).by(0)
      end

      it 'renders a JSON response with errors for the new question' do
        post questions_url, headers: Requests::JsonHelpers::HEADERS, params: build_jsonapi_parameters({ "body": nil }, 'questions')

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
