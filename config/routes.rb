Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  delete "/sign_out" => "users#destroy", as: "sign_out"
  get "/sign_in" => "users#sign_in", as: "sign_in"
  post "/login" => "users#login", as: "login"

  get "/sign_up" => "users#new", as: "sign_up"

  root 'welcome#index'
  
  get "posts/search" => 'posts#search', as: 'search'
 
  resources :users, controller: "users", only: [:create, :show] do
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end

  resources :posts
end
