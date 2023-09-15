Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    # Defines the root path route ("/")
    # root "articles#index"
    resources :reviews, only: [ :new, :create ]
  end
end
