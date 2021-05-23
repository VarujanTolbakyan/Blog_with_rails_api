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
  
* For gets articles use command `$ curl -X GET -H 'Content-Type: application/json' -H 'Authorization: aut_token' http://localhost:3000/articles`

* output
 
* /*************************/example

 `{
   "articles" : [
      {
         "body" : "Lorem ipsum dolor sit amet, debet oportere sit an,  mei ut soluta eruditi. In per sapientem reprehendunt.",
         "category" : "news",
         "created_at" : "2021-05-20T17:47:13.530Z",
         "id" : 3,
         "published_at" : "2021-05-20T17:47:13.530Z",
         "title" : "Good article3",
         "updated_at" : "2021-05-20T17:47:13.530Z",
         "user_id" : 3
      },
      {
         "body" : "Lorem ipsum dolor sit amet, debet oportere sit an,  mei ut soluta eruditi. In per sapientem reprehendunt.",
         "category" : "news",
         "created_at" : "2021-05-20T17:47:13.518Z",
         "id" : 2,
         "published_at" : "2021-05-20T17:47:13.518Z",
         "title" : "Good article2",
         "updated_at" : "2021-05-20T17:47:13.518Z",
         "user_id" : 2
      }
   ],
   "count" : 2
}
`

* For `create` or `update` article use command `$ curl -X` POST or PUT `-H 'Content-Type: application/json' -H 'Authorization: auth_token' -d '{"article": {"title": "title", "body": "article body"}}' http://localhost:3000/articles` or `http://localhost:3000/articles/4`

* output 

* /****************************/example

 `{
   "article" : {
      "body" : "Lorem ipsum dolor sit amet, debet oportere sit an,  mei ut soluta eruditi. In per sapientem reprehendunt.",
      "category" : "common",
      "created_at" : "2021-05-23T11:33:21.802Z",
      "id" : 4,
      "published_at" : "2021-05-23T11:33:21.802Z",
      "title" : "Article 1",
      "updated_at" : "2021-05-23T11:33:21.802Z",
      "user_id" : 5
   }
}
`
* For filter by author or category use command `$ curl -X GET -H 'Content-Type: application/json' -H 'Authorization: auth_token' 'http://localhost:3000/articles?author_id=3&category=news'`

* output

* /*************************************/

 `{
   "articles" : [
      {
         "body" : "Lorem ipsum dolor sit amet, debet oportere sit an,  mei ut soluta eruditi. In per sapientem reprehendunt.",
         "category" : "news",
         "created_at" : "2021-05-20T17:47:13.530Z",
         "id" : 3,
         "published_at" : "2021-05-20T17:47:13.530Z",
         "title" : "Good article3",
         "updated_at" : "2021-05-20T17:47:13.530Z",
         "user_id" : 3
      }
   ],
   "count" : 1
}
`

* comment `create` or `update` uses command `$ curl -X` POST or PUT `-H 'Content-Type: application/json' -H 'Authorization: auth_token' -d '{"comment": {"body": "comment body"}}' http://localhost:3000/articles/3/comments` or `http://localhost:3000/articles/3/comments/9`

* output 

 `{
   "comment" : {
      "article_id" : 3,
      "body" : "comment body",
      "created_at" : "2021-05-23T12:02:50.772Z",
      "id" : 9,
      "updated_at" : "2021-05-23T12:02:50.772Z",
      "user_id" : 5
   }
}
` 


* ․․․․․․․․․․․ etc․


