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

echo 'DOING rails generate model user email:email:uniq pseudo:string:uniq desc:text age:integer avatar_name:string last_name:string first_name:string pwd:string isAdmin:boolean'
rails generate model User email:string:uniq pseudo:string:uniq desc:text age:integer avatar_name:string last_name:string first_name:string pwd:string isAdmin:boolean
echo 'DOING rails generate model article title:string:uniq content:text user:references'
rails generate model Article title:string:uniq content:text user:references
echo 'DOING rails generate model Comment content:text pseudo:string comment:references article:references'
rails generate model Comment content:text pseudo:string comment:references article:references

echo 'DOING rake db:migrate'
rake db:migrate
