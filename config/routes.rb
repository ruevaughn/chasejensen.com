Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'static#home'
  get '/home' => 'static#home', as: 'home'
  get '/portfolio' => 'static#portfolio', as: 'portfolio'
  get '/blog' => 'static#blog', as: 'blog'
  get '/me' => 'sessions#new', as: 'login'

  resource :searches, controller: 'search', only: [:create]
  resources :articles, only: [:index, :show, :new]

  namespace :api, defaults: { format: 'json' } do
    get 'generate/preview', to: 'generator#preview'
    resources :articles
  end
end
