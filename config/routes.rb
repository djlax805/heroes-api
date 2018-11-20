Rails.application.routes.draw do
  resources :heroes, only: [:show, :index]
end
