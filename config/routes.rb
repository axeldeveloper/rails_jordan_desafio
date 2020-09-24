Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
        #get 'metters/index'
        #post 'metters/create'
        get  'searchs/list/',      to: 'searchs#list'
        get  'searchs/show/:id',   to: 'searchs#show'
        get  'searchs/status',     to: 'searchs#status'
        put  'searchs/update/:id', to: 'searchs#update_list'
        post 'searchs/include/',   to: 'searchs#include_list'
        
        # delete 'metters/destroy/:id', to: 'metters#destroy'
    end
end
  
  root 'home#index'
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
