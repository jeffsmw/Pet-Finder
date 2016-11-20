Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # get '/auth/facebook', as: :sign_in_with_facebook
    # get '/auth/facebook/callback' => 'callbacks#facebook'

    # resources :users, only: [:create, :new]
    # resources :sessions, only: [:new, :create] do
    #   delete :destroy, on: :collection
    # end

    # resources :pets, shallow: true do
    #   resources :sightings, only: [:create, :destroy] do
    #     resources :messages, only: [:create, :destroy]
    #   end
    # end

    # get '/contact' => 'home#contact'
    # post '/contact_submit' => 'home#contact_submit'

  root 'home#index'
  resources :users
  resources :sessions
  resources :sightings
  resources :pets

  resources :home, only: :index

end
