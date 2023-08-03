class AnswerResource < JSONAPI::Resource
  attributes :body

  has_one :question
end
