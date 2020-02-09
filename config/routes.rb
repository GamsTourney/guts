Rails.application.routes.draw do
  post '/auth/login' => 'player_token#create'
  shallow do
    resources :tournaments do
      member do
        get 'standings'
      end

      resources :matches do
        member do
          post 'attach_picture'
        end
      end
      resources :games
      resources :players
    end
  end
end
