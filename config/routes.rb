Rails.application.routes.draw do
  resources :answers
  scope :api do
    scope :v1 do
      jsonapi_resources :questions, only: [:index, :create, :show]
      jsonapi_resources :answers, only: [:create]
    end
  end
end
