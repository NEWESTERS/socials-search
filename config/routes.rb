# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  get 'top/all'

  get 'top/hour'

  get 'top/day'

  get 'top/week'

  get 'top/month'

  resources :requests
  resources :histories
  devise_for :users
  
  get 'users/profile'

  get 'search/input'

  get 'search/view'

  get '/search_req' => 'search#view'

  root 'search#input'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
