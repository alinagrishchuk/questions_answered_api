class QuestionResource < JSONAPI::Resource
  attributes :title, :body, :created_at
end
