Dummy::Application.routes.draw do
  resources :recipes, only: [:show, :create]
end
