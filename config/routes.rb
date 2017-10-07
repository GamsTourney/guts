Rails.application.routes.draw do
  resources :tournaments, defaults: {format: :json}
end
