Rails.application.routes.draw do
  	devise_for :users, controllers: { registrations: 'users/registrations' }
  	resources :users do
    		resource :profile
      end

      resources :conversations, only: [:index, :show, :destroy] do
      	member do
      		post :reply
      		post :restore
      		post :mark_as_read
      	end
      	collection do
      		delete :empty_trash
      	end
      end

      resources :messages, only: [:new, :create]

      resources :users, only: [:index]

	resources :contacts
	get '/about' => 'pages#about'
	root 'pages#index'
end
