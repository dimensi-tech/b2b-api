# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    # devise_for :customers
    resources :customers do
      collection do
        get :confirm_email
      end
    end
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
        post :modify_booking
        post :cancel_booking
        post :assign_identities
        post :assign_passports
        post :update_midtrans
        post :saving_paid
        get :list_bookings
        get :list_paid_bookings
        get :savings_customer
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

    resources :payment_savings do
      collection do
        post :create_payment_saving
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
