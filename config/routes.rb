Rails.application.routes.draw do
  namespace :v1 do
    resources :customers
    resources :packages
    resources :tokens, only: :create

    resources :ads do
      collection do
        get :active_ads
      end
    end

    resources :bookings do
      collection do
        post :create_booking
        post :assign_identities
        get :list_bookings
      end
    end

    resources :products do
      collection do
        get :list_products
      end
    end

    get 'product/:product_id', to: 'products#product_detail'
  end
end
