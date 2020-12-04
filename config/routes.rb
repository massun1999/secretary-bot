Rails.application.routes.draw do
  resources :replies
  resources :posts
  post '/callback', to: 'line_events#callback'
end
