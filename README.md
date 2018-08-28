## Getting Started

To run this application locally, you will need to either clone this repository or fork it. You can also download the entire repository as a zip package and run locally.

## Features

OnboardingManager is an API service aimed at automating simple tasks that can be monitored by the admins.

For full access to the API, an employee is required. You need to be logged in to use the api. This request generates a JSON Web Token, which is returned in the response. This token is used to authenticate subsequent requests to the API.

## API EndPoints

The following endpoints are available

| EndPoint                                |   Functionality                      |
| --------------------------------------- | ------------------------------------:|
| POST /api/v1/login                      | Logs a user in                       |
| GET /api/v1/logout                      | Logs a user out                      |
| POST /api/v1/admin/employees            | admin Create a new employee          |
| POST /api/v1/admin/tasks                | admin Create a new task              |
| PUT /api/v1/tasks/:id                   | Admin updates a task                 |


## Dependency

OnbordingManager runs on `ruby 2.3.1 and rails 5.2.1`. It uses postgres database.

To run the app

* clone the app

* cd into the repo

* run bundle install

* run all the specs. It should all be green

* run `rails s`

## Database Setup

Run the following command from the terminal:
```
rails db:create db:migrate
```
Create the database for the test environment as well:
```
rake db:create db:migrate RAILS_ENV=test

## Running the tests

Run the following command from the terminal to get all tests running
```
rspec spec
```
