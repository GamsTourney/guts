Rails.application.routes.draw do
  resources :match_results
  resources :matches, defaults: {format: :json}
  resources :tournaments, defaults: {format: :json}
  resources :players, defaults: {format: :json}
  resources :games, defaults: {format: :json}
end
