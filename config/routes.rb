Rails.application.routes.draw do
  resources :breweries, only: [:index, :show, :create, :update, :destroy]
  patch "/breweries/:id/like", to: "breweries#increment_likes"
  patch "/breweries/:id/like", to: "breweries#decrement_likes"
end
