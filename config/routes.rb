Rails.application.routes.draw do
  get 'reviews/new'
  resources :restaurants, except: [:destroy, :edit, :update] do
    resources :reviews, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
