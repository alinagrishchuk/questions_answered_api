FactoryBot.define do
  factory :answer do
    association :question
    body { 'Body' }
  end
end
