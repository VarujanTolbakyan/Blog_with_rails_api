# Blog_with_rails_api

* Ruby version 2.7.2

* Rails version 6.0.3.7

* Database postgresql

 

## Getting started

* `$ git clone git@github.com:VarujanTolbakyan/Blog_with_rails_api.git`

 
* `$ bundle`


* `$ rails db:create db:migrate db:seed`

* `$ rails server`

* For registration use command `$ curl -X POST -H 'Content-Type: application/json' -d '{"user": {"name": "name", "email": "example@gmail.com", "password": "example<=>1"}}' http://localhost:3000/users`

* output:
   `{ "auth_token" : "some token" }   (token // 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2MjE4NTM2MjJ9.3e6NKMV63XOqldb2pDg_4o6WK9UjiIIv8bGogya8MSU')`
   


* For login use command `$ curl -X POST -H 'Content-Type: application/json' -d '{"user": {"email": "example@gmail.com", "password": "example<=>1"}}' http://localhost:3000/users/login`

* output:
  `{ "auth_token" : "some token" }   (token // 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2MjE4NTM2MjJ9.3e6NKMV63XOqldb2pDg_4o6WK9UjiIIv8bGogya8MSU')`

