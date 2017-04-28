Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "home#index"

  get '/session/new' => "session#new"
  post '/session' => "session#create"
  delete '/session/:id' => "session#destroy"

  get '/users/view_user/:id' => "users#view_user"

  resources :users

  resources :posts do
    resources :comments
  end

end
