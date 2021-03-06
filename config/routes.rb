NflApp::Application.routes.draw do
	root to: "players#index"
    get "/players/:nfl_id", to: "players#show"
    patch "/players/:nfl_id", to: "players#favorite"
    delete "/players/:nfl_id", to: "players#remove"
    get "/players", to: "players#search"
    post "/users", to: "users#create"
    delete "/users/:id", to: "users#destroy"
    post "/sessions", to: "sessions#create"
    delete '/sessions', to: 'sessions#destroy'
    get "/users/favorite", to: 'users#favorite'
    get '/users/:id', to: 'users#show'
    get "/positions/:name", to: "players#position"
end
