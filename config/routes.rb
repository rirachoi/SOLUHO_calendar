Rails.application.routes.draw do
  root :to => 'calendars#home'

  get '/calendars/year' => 'calendars#year'
  get '/calendars/international' => 'calendars#international'
  get '/calendars/international_lists' => 'calendars#international_lists'
  resources :calendars, :only => [:index]

  get '/events/lists' => 'events#lists'
  get '/events/kinds' => 'events#kinds'
  get '/events/kind/:kind' =>'events#kind'
  resources :events

  resources :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # resources :events do
  #   get :lists
  #   get :kinds
  # end

end

#                          root GET    /                                        calendar#home
#                calendars_year GET    /calendars/year(.:format)                calendars#year
#       calendars_international GET    /calendars/international(.:format)       calendars#international
# calendars_international_lists GET    /calendars/international_lists(.:format) calendars#international_lists
#                     calendars GET    /calendars(.:format)                     calendars#index
#                  events_lists GET    /events/lists(.:format)                  events#lists
#                  events_kinds GET    /events/kinds(.:format)                  events#kinds
#                               GET    /events/kind/:kind(.:format)             events#kind
#                        events GET    /events(.:format)                        events#index
#                               POST   /events(.:format)                        events#create
#                     new_event GET    /events/new(.:format)                    events#new
#                    edit_event GET    /events/:id/edit(.:format)               events#edit
#                         event GET    /events/:id(.:format)                    events#show
#                               PATCH  /events/:id(.:format)                    events#update
#                               PUT    /events/:id(.:format)                    events#update
#                               DELETE /events/:id(.:format)                    events#destroy
#                         users GET    /users(.:format)                         users#index
#                               POST   /users(.:format)                         users#create
#                      new_user GET    /users/new(.:format)                     users#new
#                     edit_user GET    /users/:id/edit(.:format)                users#edit
#                          user GET    /users/:id(.:format)                     users#show
#                               PATCH  /users/:id(.:format)                     users#update
#                               PUT    /users/:id(.:format)                     users#update
#                               DELETE /users/:id(.:format)                     users#destroy
#                         login GET    /login(.:format)                         session#new
#                               POST   /login(.:format)                         session#create
#                               DELETE /login(.:format)                         session#destroy