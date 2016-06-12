Rails.application.routes.draw do
  root to: "welcome#index"

  delete "/logout", to: "sessions#destroy"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"

  resource :vendor, only: [:update]
  get "/profile", to: "vendors#show"
  get "/edit", to: "vendors#edit", as: :edit_vendor
  get "/:event", to: "events#show", as: :event
  get "/:event/apply", to: "applications#new", as: :applications
  post "/:event/apply", to: "applications#create"
end

# session[:edit_vendor_redirect] =
