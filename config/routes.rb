Rails.application.routes.draw do
  root "welcome#index"

  resources :word, only: [:create, :destroy, :show]
end
