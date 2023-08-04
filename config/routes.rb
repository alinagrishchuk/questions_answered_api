Rails.application.routes.draw do
  jsonapi_resources :questions, only: [:index, :create, :show]
  jsonapi_resources :answers, only: [:create]
end
