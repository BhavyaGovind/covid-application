Rails.application.routes.draw do
  root :to => 'dash_board#home'
  resources :users, :only => [:index, :new, :create]
  resources :symptoms, :only => [:new, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  get '/covid_zones' => 'covid#zones'
  get '/covid_graph' => 'covid#graph'
  get '/covid_hospitals' => 'covid#hospitals'

  get '/search' => 'dash_board#search'
  get '/result' => 'symptoms#result'
end
