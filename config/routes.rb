Rails.application.routes.draw do
  resources :tournaments, defaults: {format: :json}
  resources :players, defaults: {format: :json}
end
