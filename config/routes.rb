Rails.application.routes.draw do
  post '/auth/login' => 'player_token#create'
  shallow do
    resources :tournaments do
      resources :matches
      resources :games
    end
    
    resources :players
  end
end
