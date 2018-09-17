Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'posts#index'
    get 'add-to-cart' => 'posts#add_to_cart'
    resources :posts
    resources :pictures, only: [:create, :destroy]
    resources :tags, only: [:show]
    resources :posts do
      resources :comments
    end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
