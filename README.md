# README

## Projeto jorda 
    * Ruby version

    * Database creation

    * Database initialization

    * How to run the test suite

    * Services (job queues, cache servers, search engines, etc.)

    * Deployment instructions

    * Docker 

# Mini tutorial 
    $ bundle install
    $ rails new jordan_desafio --webpack=vue
    $ rails generate controller Home index
    $ gem 'pg', '>= 0.18', '< 2.0' 
    $ RAILS_ENV=development rake db:create or rails db:create
    $ rails g model Blacklist cpf:string active:boolean
    $ rails db:migrate
    $ rails db:seed
    * rails g controller api/v1/searchs
    


# Routes
  root 'Home#index'



# Front
yarn add axios vue-axios
yarn add vue-router
yarn add vue-material

# Backend
backend: bin/rails s -p 3000
frontend: bin/webpack-dev-server




https://web-crunch.com/posts/ruby-on-rails-api-vue-js
https://www.agiratech.com/blog/create-application-rails-vue-js

https://forum.vuejs.org/t/module-not-found-error-cant-resolve-vue-router/72779

https://vuematerial.io/components/list/

https://medium.com/better-programming/building-self-joins-and-triple-joins-in-ruby-on-rails-455701bf3fa7