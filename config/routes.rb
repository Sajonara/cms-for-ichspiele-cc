Rails.application.routes.draw do
  
  root "pages#home"
  
  get '/impressum', to: 'pages#about'
  get '/anmelden', to: 'pages#signup'
  get '/hilfe', to: 'pages#help'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    root 'admin#index'
    get 'games/' => 'games#index'
    get 'news/' => 'news#index'
    # add backend resources for games to the admin panel | define them at controllers/admin/games_controller.rb
    resources :games, only: [:new, :create, :edit, :update, :destroy]
    # add resources for news to the admin panel | define them at controllers/admin/news_controller.rb
    resources :news, only: [:new, :create, :edit, :update, :destroy]
  end
  
  # add frontend resources for games | define them at controllers/games_controller.rb
  resources :games, only: [:index, :show]
  # add frontend resources for news | define them at controllers/news_controller.rb
  resources :news, only: [:index, :show]
  # add frontend resources for users | define them at controllers/users_controller.rb
  resources :users, only: [:show, :new, :create, :destroy]
end
