Rails.application.routes.draw do
  mount RailsSettingsUi::Engine, at: 'settings'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # General page routes. Will include items like home and top-level pages
  get "/pages/:page_name" => 'pages#show', :as => :page

  resources :lines, only: [:index, :show]

  match "/lines/:line_id/get_stops" => 'lines#get_stops', :as => :get_stops, via: [:get, :post]

  get "/stops/:stop_id" => 'stops#show', :as => :stop

  get "/search" => 'pages#search', :as => :search

  get "/favorites" => 'favorites#index', :as => :favorites
  get "/favorite/:stop_id" => 'favorites#new', :as => :favorite
  get "/unfavorite/:stop_id" => 'favorites#delete', :as => :unfavorite

  resources :issues
  get "/report/a" => 'issues#new_a'
  get "/report/b/1" => 'issues#new_b1'
  # get "/report/b/2" => 'issues#new_b2'
  post "report/a" => 'issues#create_a'
  post "report/b/1" => 'issues#create_b1'
  # post "report/b/2" => 'issues#create_b2'

  root 'pages#dashboard'
end
