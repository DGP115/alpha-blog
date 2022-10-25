Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #  The controller is called "pages" (actually pages.controller.rb) and the
  #   action to be invoked is call home , so the pages controller needs a method called home
  root 'pages#home'

  #  Adding an About (static) page:
  #   The get tells Rails what to do and the
  #   to tells it where to go to find the controller action for the About page
  get 'about', to: 'pages#about'

end
