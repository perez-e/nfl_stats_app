NflApp::Application.routes.draw do
	root to: "players#index"
    get "players/:nfl_id", to: "players#show"
    post "/players", to: "players#create"
    post "/users", to: "users#create"
    post "/sessions", to: "sessions#create"
    delete '/sessions', to: 'sessions#destroy'
end
