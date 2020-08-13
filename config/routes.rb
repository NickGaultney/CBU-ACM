Rails.application.routes.draw do

	namespace :api do
		namespace :v1 do
			post 'github_invite', to: 'bot#github_invite'
		end
	end

	resources :users, only: [:new, :create]

	get 'officers', to: 'users#officers'

	get 'login', to: 'sessions#new'

	post 'login', to: 'sessions#create'

	get 'logout', to: 'sessions#logout'

	root to: 'static#welcome'
	
	get "/about", to: "static#about"
end
