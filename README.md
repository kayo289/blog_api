
## Created by Ruby on Rails

## endpoint

get all blog pages: https://blogapi234.herokuapp.com/api/v1/blogs
get a blog pages: https://blogapi234.herokuapp.com/api/v1/blogs/:id
post a blog pages: https://blogapi234.herokuapp.com/api/v1/blogs/:id
delete a blog pages: https://blogapi234.herokuapp.com/api/v1/blogs/:id
edit a blog pages: https://blogapi234.herokuapp.com/api/v1/blogs/:id


post, delete, put will return a 403 if you don't pass an authentication token with it when accessing.
So If you want to check, you need to use https://blog-661a7.web.app/('/login')。

## How to run:

I've deployed both the backend and the frontend.

## Server on cloud

backend
* https://blogapi234.herokuapp.com/api/v1/blogs
* using cloud is heroku

frontend
* https://blog-661a7.web.app/
* using cloud is firebase
* リポジトリ: https://github.com/kayo289/nuxt-blog

##  authentication
using firebase auth.(oken based - e.g. JWT)
![image](https://github.com/kayo289/blog_api/blob/master/architecture.jpg)

## Store data
use Heroku Postgres

## how to test
1. cd blogapi
2. bundle install
3. rails g rspec:install
4. bundle exec rspec spec/requests/blogs_spec.rb
