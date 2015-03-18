Rails.application.routes.draw do
  root :to => 'users#index'

  resources :sessions

  resources :users do
    resources :photos
  end

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

end
