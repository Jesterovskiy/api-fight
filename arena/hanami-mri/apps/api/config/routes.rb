get '/fighters', to: 'fighters#index'
get '/fighters/:id', to: 'fighters#show'
post '/fighters', to: 'fighters#create'

# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
