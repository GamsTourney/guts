Rails.application.routes.draw do
  resources :tournaments, defaults: {format: :json} do
    member do
      get :match_competitors
    end

    resources :matches, defaults: {format: :json}, only: [:index, :create]
    resources :players, defaults: {format: :json}, only: [:index]
    resources :games, defaults: {format: :json} do
      member do
        get :matches
      end
    end
  end

  resources :players, defaults: {format: :json}, except: [:index]
  resources :games, defaults: {format: :json}, only: [:show, :create]
  resources :matches, defaults: {format: :json}, only: [:show, :destroy, :update] do
    member do
      patch :score
      get :match_competitors
    end
  end
end
