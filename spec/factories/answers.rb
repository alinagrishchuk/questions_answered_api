FactoryBot.define do
  factory :answer do
    question { question }
    body { 'Body' }
  end
end
