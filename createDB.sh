#!/bin/sh

echo 'DOING rake db:drop'
rake db:drop

echo 'DOING rails d model *'
rails destroy model *
echo 'DOING rails d model user'
rails d model user
echo 'DOING rails d model comment'
rails d model comment
echo 'DOING rails d model article'
rails d model article

echo 'DOING rails generate model User email:string:uniq pseudo:string:uniq desc:text age:integer avatar_name:string last_name:string first_name:string pwd:string isAdmin:boolean'
rails generate model User email:string:uniq pseudo:string:uniq desc:string age:integer avatar:string last_name:string first_name:string pwd:string admin:boolean
echo 'DOING rails generate model Article title:string:uniq date:datetime content:text user:reference'
rails generate model Article title:string:uniq date:datetime content:string
echo 'DOING rails generate model Comment content:text pseudo:string comment:references article:references'
rails generate model Comment content:text pseudo:string

echo 'DOING rake db:migrate'
rake db:migrate
