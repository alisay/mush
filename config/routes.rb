Rails.application.routes.draw do
  resources :mushrooms
  resources :sellers
  resources :profiles
  devise_for :users
  root 'home#page'
  get '/search' => 'pages#search', :as => 'search_page'
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  patch "/mushrooms/whatever/:id", to: "mushrooms#buy", as: "buy_shroom"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
