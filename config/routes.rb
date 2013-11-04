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

  resources :completions


  post 'completions/:id/comments' => 'completions#comment', :as => :completion_comment
  delete 'completions/:completion_id/comments/:comment_id' => 'completions#destroy_comment'

  post 'user/:id' => 'completions#create'

  # get 'user/signout' => 'sessions#destroy', as: 'signout', :via => :delete 
  
  match 'signout', to: 'sessions#destroy', as: 'signout', :via => :delete
  
  get 'users/', to: 'users#follow', as: 'follow'

  resources :completions,   only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

end
