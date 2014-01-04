Rails.application.routes.draw do
  root 'static#home'
  get '/home' => 'static#home', as: 'home'
  get '/portfolio' => 'static#portfolio', as: 'portfolio'
  get '/blog' => 'static#blog', as: 'blog'

  resource :searches, controller: 'search', only: [:create]
end
