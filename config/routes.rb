# frozen_string_literal: true

Rails.application.routes.draw do
  # Nurodomas sakninis puslapis, kuris bus pagrindinis paleidus serveri.
  root 'home#index'

  # GET metodas norit pasiekti 'prices' puslapi.
  get 'prices' => 'pages#prices', as: 'prices'

  # GET metodas norint pasiekti 'gallery' puslapi
  get 'gallery' => 'pages#gallery', as: 'gallery'

  # GET metodas norint pasiekti 'try' puslapi.
  get 'try' => 'pages#try', as: 'try'

  post '/free_try_users' => 'free_try_user#create'

  get '/list' => 'free_try_user#free_try_userslist', as: 'free_try_userslist'

  post 'delete', acton: :delete, controller: :free_try_user

  get 'edit' => 'free_try_user#edit'

  post '/update' => 'free_try_user#update'

  get 'registracija' => 'users#new', as: 'new'

  get 'registracijaAdmin' => 'users#new_admin', as: 'new_admin'

  get 'prisijungimas' => 'sessions#login', as: 'login'

  delete 'atsijungimas' => 'sessions#destroy', as: 'atsijungti'

  post '/newUser' => 'users#new_user'

  post '/newUserAdmin' => 'users#new_user_admin'

  post '/session' => 'sessions#create', as: 'session'
end
