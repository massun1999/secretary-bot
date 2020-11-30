Rails.application.routes.draw do
  post '/callback', to: 'line_events#callback'
end
