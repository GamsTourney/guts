Rails.application.routes.draw do
  resources :match_results
  resources :tournaments, defaults: {format: :json} do
    member do
      get :standings
    end
    resources :matches, defaults: {format: :json}, only: [:index, :create]
  end
  resources :matches, defaults: {format: :json}, only: [:show, :destroy, :update]
  resources :players, defaults: {format: :json}
  resources :games, defaults: {format: :json}
end
