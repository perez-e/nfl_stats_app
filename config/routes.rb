NflApp::Application.routes.draw do
  get "players/:id", to: "players#show"
end
