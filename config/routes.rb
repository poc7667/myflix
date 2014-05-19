Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  resources :videos, only:  [:show]
end
