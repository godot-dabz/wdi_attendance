Rails.application.routes.draw do
  root "welcome#login"
  resources :producers
end
