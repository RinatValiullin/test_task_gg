Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :message, only: [:create]
    resources :recepients, only: [:index] do
      member do
        get :campaign_list
      end
    end
  end
end
