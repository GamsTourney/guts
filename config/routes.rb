Rails.application.routes.draw do
  resources :tournaments, defaults: {format: :json} do
    resources :matches, defaults: {format: :json}, only: [:index, :create]
  end

  resources :matches, defaults: {format: :json}, only: [:show, :destroy, :update] do
    member do
      patch :score
    end
  end

  resources :players, defaults: {format: :json}

  resources :games, defaults: {format: :json} do
    collection do
      get :scores
    end

    member do
      get :scores
      get :matches
    end
  end

  resources :scores, defaults: {format: :json}, only: [:show, :index]
end
