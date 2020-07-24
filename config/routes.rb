Rails.application.routes.draw do

 	resources :users do
 		member do
 			get :confirm_email
 		end	
 	end

	get 'officers', to: 'users#index'

	get 'login', to: 'sessions#new'

	post 'login', to: 'sessions#create'

	get 'logout', to: 'sessions#logout'

	root to: 'static#welcome'
	
	get "/about", to: "static#about"

	get "/posts", to: "posts#index"
	post "/posts", to: "posts#create"
end
