Rails.application.routes.draw do

  root 'sessions#new'

  resources :users
  resources :instructors

  resources :students do
    resources :attendances
  end

  resources :producers do
    resources :cohorts do
      get '/overview' => 'cohorts#overview'
    end
  end

  resources :cohorts do
    get '/overview' => 'cohorts#overview'
    get '/calendar' => 'cohorts#calendar'
    resources :students do
      resources :attendances
    end
  end

  resources :attendances

  # session links
  get  "/", to: "sessions#new"                 # sign in form
  post "/sessions", to: "sessions#create"      # log in
  delete "/sessions", to: "sessions#destroy"   # log out

  post "sms", to: "twilio#index"

end
