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
      end
    end

    resources :products do
      collection do
        get :list_products
        get :product_detail
      end
    end
  end
end
