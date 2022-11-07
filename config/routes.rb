# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#
Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  #  The controller is called "pages" (actually pages.controller.rb) and the
  #   action to be invoked is call home , so the pages controller needs a method called home
  root 'pages#home'

  #  Adding an About (static) page:
  #   The below maps the uri provided by the  Rails Get action to the controller given by
  #   "pages" and the "about" action within that contoller
  get 'about', to: 'pages#about'

  # Provides the basic CRUD routes [from base class] for articles
  resources :articles, only: %i[show index]
end
