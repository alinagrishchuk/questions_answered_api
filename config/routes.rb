Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      jsonapi_resources :questions, only: [:index, :create, :show]
    end
  end
end
