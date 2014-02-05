NflApp::Application.routes.draw do
	root to: "players#index"
    get "players/:id", to: "players#show"
    post "/players", to: "players#create"
    post "/users", to: "users#create"
end
