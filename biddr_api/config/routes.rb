Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do 
    namespace :v1 do 
      resources :auctions, only: [:create, :show, :index]
      resources :bids, only: [:create]
<<<<<<< HEAD
      resource :session, only: [:create, :destroy]
      resource :user, only: [] do
        get :current, on: :collection
      end
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
    end
  end
end
