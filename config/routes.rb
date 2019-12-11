Rails.application.routes.draw do

  shallow do
    resources :tournaments, defaults: {format: :json} do
      resources :matches, defaults: {format: :json}
      resources :players, defaults: {format: :json}
      resources :games, defaults: {format: :json}
    end
  end
end
