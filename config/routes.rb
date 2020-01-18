Rails.application.routes.draw do
  post '/auth/login' => 'player_token#create'
  shallow do
    resources :tournaments do
      member do
        get 'standings'
      end

      resources :matches
      resources :games
      resources :players
    end
  end
end
