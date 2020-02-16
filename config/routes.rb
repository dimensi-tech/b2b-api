# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :customers
    resources :tokens, only: :create

    resources :ads do
      collection do
        get :active_ads
      end
    end

    resources :banners do
      collection do
        get :active_banners
      end
    end

    resources :bookings do
      collection do
        post :create_booking
        post :assign_identities
        post :update_midtrans
        get :list_bookings
      end
    end

    resources :products do
      collection do
        get :list_products
      end
    end

    resources :packages do
      collection do
        get :package_detail
      end
    end

    resources :payments do
      collection do
        get :veritrans_token
      end
    end

    resources :travel_destinations do
      collection do
        get :featured_destinations
        get :detail_travel_destination
      end
    end

    resources :vouchers do
      collection do
        post :create_voucher_usage
        get :detail_voucher
      end
    end

    get 'product/:product_id', to: 'products#product_detail'
    get 'booking/:booking_id', to: 'bookings#booking_detail'
  end
end
