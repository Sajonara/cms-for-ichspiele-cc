Rails.application.routes.draw do
  
  root "pages#home"
  
  get '/impressum', to: 'pages#about'
  
  get '/hilfe', to: 'pages#help'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    root 'admin#index'
    get 'games/' => 'games#index'
    resources :games, only: [:new, :create, :edit, :update, :destroy]
  end
  
  resources :games, only: [:index, :show]
end
