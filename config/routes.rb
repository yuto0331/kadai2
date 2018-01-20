Rails.application.routes.draw do
    resources :blogs do
    # root to: 'blogs#index'
    collection do
        post :confirm
    end
    end
end
