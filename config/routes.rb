Rails.application.routes.draw do
  root "welcome#index"

  get  "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resource :vendor, only: [:update]
  get "/profile", to: "vendors#show"
  get "/edit", to: "vendors#edit", as: :edit_vendor
  get "/:city", to: "events#index", as: :city
  get "/:city/:event", to: "events#show", as: :event
  get "/:city/:event/apply", to: "applications#new", as: :applications
  post "/:city/:event/apply", to: "applications#create"
end
