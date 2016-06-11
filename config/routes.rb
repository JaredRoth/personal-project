Rails.application.routes.draw do
  root to: "welcome#index"

  delete "/logout", to: "sessions#destroy"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"

  resource :vendor, only: [:edit, :update]
  get "/profile", to: "vendors#show"
  get "/edit", to: "vendors#first", as: :first_vendor
end
