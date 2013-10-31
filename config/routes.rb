Crossfithub::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "signout"}

  # devise_scope :user do
  #   delete "/signout" => "devise/sessions#destroy"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'users#index'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :completions

  post 'user/:id' => 'completions#create'

  # get 'user/signout' => 'sessions#destroy', as: 'signout', :via => :delete 
  
  match 'signout', to: 'sessions#destroy', as: 'signout', :via => :delete
  
  get 'users/', to: 'users#follow', as: 'follow'

end
