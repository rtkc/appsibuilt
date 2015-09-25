Rails.application.routes.draw do
  root to: 'apps#index' #route home/root to index of apps

  get'/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, except: [:index, :destroy]   #create CRUD routes for users
  resources :apps, except: [:destroy] do  #nested routes creates nested paths e.g. magazine/magazine_id/ad/ad_id
    resources :comments, only: [:create]
  end
  resources :categories, except: [:index, :destroy]
end
