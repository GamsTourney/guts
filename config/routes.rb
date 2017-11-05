Rails.application.routes.draw do
  resources :matches
  resources :tournaments, defaults: {format: :json} do
    resources :games, defaults: {format: :json}
  end
  resources :players, defaults: {format: :json}
end
