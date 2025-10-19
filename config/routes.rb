Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  Rails.application.routes.draw do
    root "main#index"

    get "/login",  to: "sessions#new"
    post "/login",  to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    get "/register", to: "user#new"
    post "/register", to: "user#create"
    get "/user_update", to: "user#get"
    post "/user_update", to: "user#update"
    post "/user_lock/:id", to: "user#lock", as: "user_lock"
    post "/user_unlock/:id", to: "user#unlock", as: "user_unlock"
    get "/user_detail/:id", to: "user#detail", as: "user_detail"

    get "/request/list", to: "request#list", as: "request_list"
    post "/request_accep/:id", to: "request#accep", as: "request_accep"
    post "/request_denial/:id", to: "request#denial", as: "request_denial"

    get "/request/:id", to: "request#new", as: "request"
    post "/request/:id", to: "request#create", as: "request_save"

    get "/timetable", to: "timetable#list"

    get "/support", to: "support#list"
    post "/support/processing/:id", to: "support#processing", as: "support_processing"
    post "/support/closed/:id", to: "support#closed", as: "support_closed"

  end

end
