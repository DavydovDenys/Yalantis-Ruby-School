Rails.application.routes.draw do
  resources :couriers do
    resources :packages, only: %i[create]
  end
end
