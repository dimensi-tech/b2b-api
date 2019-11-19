Rails.application.routes.draw do
  namespace :v1 do
    resources :customers
    resources :tokens, only: :create

    resources :products do
      collection do
        get :list_products
        get :product_detail
      end
    end
  end
end
