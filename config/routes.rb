Rails.application.routes.draw do
  devise_for :users
  root to: "babies#show"
  resources :babies
end

