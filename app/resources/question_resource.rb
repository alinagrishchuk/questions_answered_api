class QuestionResource < JSONAPI::Resource
  attributes :title, :body, :created_at

  has_many :answers
end
