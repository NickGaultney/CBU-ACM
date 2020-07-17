Rails.application.routes.draw do

	resources :users, only: [:new, :create]

	get 'officers', to: 'users#officers'

	get 'login', to: 'sessions#new'

	post 'login', to: 'sessions#create'

	get 'logout', to: 'sessions#logout'

	root to: 'static#welcome'
	
	get "/about", to: "static#about"

	get "/posts", to: "posts#index"
	post "/posts", to: "posts#create"
end
