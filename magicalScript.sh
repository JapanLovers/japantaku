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

echo 'DOING rails g scaffold User email:string:uniq pseudo:string:uniq desc:text age:integer avatar_name:string last_name:string first_name:string pwd:string isAdmin:boolean salt:'
rails g scaffold User email:string:uniq pseudo:string:uniq desc:text age:integer avatar_name:string last_name:string first_name:string pwd:string isAdmin:boolean
echo 'DOING rails g scaffold Article title:string:uniq content:text user:references'
rails g scaffold Article title:string:uniq content:text user:references
echo 'DOING rails g scaffold Comment content:text pseudo:string comment:references article:references'
rails g scaffold Comment content:text pseudo:string comment:references article:references

echo 'DOING rake db:migrate'
rake db:migrate
