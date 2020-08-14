Rails.application.routes.draw do
	devise_for :users, controllers: { registrations: 'users/registrations' }

	root 'homes#top'
	get 'about' => 'homes#about'

	resources :posts do
		resources :post_comments, only: [:create, :destroy]
		resources :favorites, only: [:create, :destroy]
	end

	resources :users
end