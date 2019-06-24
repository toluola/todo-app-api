Rails.application.routes.draw do
  resources :todos do
    resources :items
  end
  post "auth/login" => "authentication#authenticate"
  post "auth/signup" => "users#create"
end
