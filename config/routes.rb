Rails.application.routes.draw do
    root 'blogs#top'
    resources :blogs do
    collection do
        post :confirm
    end
    end
end
