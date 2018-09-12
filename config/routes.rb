Rails.application.routes.draw do
  root "welcome#index"
  post '/word-search', to: 'word_search#create'
end
