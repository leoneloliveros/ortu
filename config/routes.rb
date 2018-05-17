Rails.application.routes.draw do
  
	root to: "welcome#index"
  	get 'welcome/index'
  	devise_for :users
  	resources :profiles, only: [:show]
  	resources :posts do
  		resources :pictures
  	end
end
