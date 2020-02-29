Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  	devise_scope :user do
  		get 'admins/sign_in', to: 'devise/sessions#new'
  		root to: 'devise/sessions#new'
			post 'api/v1/sign_up', to: 'devise/registrations#new'
	end

  namespace :admins do
  	resources :auctions
  	resources :auction_items
  	resources :auction_bids, only: [:index]
  end

	namespace :api , defaults: { format: 'json' } do
    namespace :v1 do
      devise_scope :user do
        post 'sign_in', to: 'sessions#create'
      end
    	resources :auctions, only: [:index, :show] do
  		  resources :auction_items, only: [:index, :show]
  		end
  		resources :auction_bids, except: [:delete] do
        collection do
          get :highest_bids
          get :list_bids
        end
      end
    end
  end
end
