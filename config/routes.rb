NflApp::Application.routes.draw do
  get "player/:id", to: "players#show"
end
