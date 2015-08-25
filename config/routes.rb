Rubymon::Application.routes.draw do

  root 'welcome#index'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  # Global Resources
  resources :users do
    resources :monsters
  end
  
end
