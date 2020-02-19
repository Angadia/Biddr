Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do 
    namespace :v1 do 
      resources :auctions, only: [:create, :show, :index]
      resources :bids, only: [:create]
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
      resource :session, only: [:create, :destroy]
      resource :user, only: [] do
        get :current, on: :collection
      end
<<<<<<< HEAD
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
    end
  end
end
