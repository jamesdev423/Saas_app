Rails.application.routes.draw do
  	devise_for :users, controllers: { registrations: 'users/registrations' }
  	resources :users do
    		resource :profile
      end

      resources :conversations do
          resources :messages

          collection do
              get :inbox
              get :all, action: :index
              get :sent
              get :trash
          end
      end

	resources :contacts
	get '/about' => 'pages#about'
	root 'pages#home'
end
