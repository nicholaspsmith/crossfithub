Crossfithub::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "signout"}

  root 'users#index'

  resources :users do
    member do
      get :following, :followers
    end
  end

  # may need to be nested
  resources :votes

  resources :completions do
    resources :comments
  end


  post 'user/:id' => 'completions#create'

  # get 'user/signout' => 'sessions#destroy', as: 'signout', :via => :delete 
  
  match 'signout', to: 'sessions#destroy', as: 'signout', :via => :delete
  
  get 'users/', to: 'users#follow', as: 'follow'

  resources :completions,   only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

end
