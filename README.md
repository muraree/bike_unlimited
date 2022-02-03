# BIKE UNLIMITED

Things you may want to cover:

* Ruby version
    ruby 3.1.0

* Rails version
    Rails 6.1.4.4



`Steps to Setup Project` -

Take a clone -
    `url` - 'https://github.com/muraree/bike_unlimited.git'

* Run bundle install

* Create Database
    `rails db:create`
    `rails db:migrate`

* To run rails server
    `rails s`

* To check API is running well -
  `Use Postman`
  You can use Chrome or any other browser extension also.

API EndPoints-

  * Create User -
    url - http://localhost:3000/users
    Method Type - POST
    Headers  -
      Content-Type - application/json
    Body -
    {
      "name": String,
      "username": String
      "email": String
      "password": String
    }


    Result -

      {
          "id": integer,
          "name": String,
          "username": String
          "email": String
          "created_at": Datetime,
          "updated_at": Datetime
      }


  * Retrieve a user
    url - http://localhost:3000/auth/login
    Method Type - POST
    Headers  -
      Content-Type - application/json

    Result-

    {
    "token": "string",
    "exp": "02-04-2022 20:56",
    "username": "string"
    }


  * Importing and Mailing CSV Using Background Job
    url - http://localhost:3000/riders/import_csv
    Method Type - POST
    Headers  -
      Content-Type - application/json
      Authorization : after login add Authorization token to header from auth/login response

    Body -
    {
      "file": sample.csv
    }


  * If Authorization token is wrong
    url - http://localhost:3000/riders/import_csv
    Method Type - POST
    Headers  -
      Content-Type - application/json

    Authorization : Nil/wrong

    BODY -
    {
    "errors": "Signature verification raised"
    }



