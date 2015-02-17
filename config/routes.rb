Rails.application.routes.draw do

  get ''

  root "welcome#login"
  resources :producers

end
