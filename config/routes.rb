Rails.application.routes.draw do
  resources :tournaments, defaults: {format: :json} do
    member do
      get :standings
    end
    resources :matches, defaults: {format: :json}, only: [:index, :create]
  end
  resources :matches, defaults: {format: :json}, only: [:show, :destroy, :update] do
    member do
      patch :score
    end
  end
  resources :players, defaults: {format: :json}
  resources :games, defaults: {format: :json}
end
