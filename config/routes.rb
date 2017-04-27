Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "home#index"

  get '/session/new' => "session#new"
  post '/session' => "session#create"
  delete '/session/:id' => "session#destroy"

  resources :users
  get '/users/sign_in_form' => "users#sign_in_form"
  post '/users' => "users#sign_in"

  resources :posts do
    resources :comments
  end

end
