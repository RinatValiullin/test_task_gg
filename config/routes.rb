Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :company, only: [:create]
    resources :clients, only: [:index] do
      member do
        get :companies_list
      end
    end
  end
end
