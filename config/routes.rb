Rails.application.routes.draw do
  root "welcome#index"

  resources :words, only: [:create, :destroy, :show]
end
