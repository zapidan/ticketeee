# Ticketee
[![Build Status](https://travis-ci.org/zapidan/ticketeee.svg?branch=master)](https://travis-ci.org/zapidan/ticketeee)

Ticket management website built using TDD (RSpec + Capybara). This has been built following [Rails 4 in Action](https://www.manning.com/books/rails-4-in-action) book. Some of the features include:

- CRUD operations on tickets belonging to particular projects. File uploading with [CarrierWave](https://github.com/carrierwaveuploader/carrierwave)
- Authentication using [Devise](https://github.com/plataformatec/devise)
- User management from admin UI
- Role based authorization using [Pundit](https://github.com/elabs/pundit) policies. Users have roles on certain projects, which determines the allowed actions within each resource
- State tracking history on tickets
- Ability to add comments on tickets and change state
- Email subscription of ticket comments (watchers)
- Tagging and searching on tags (tag:tagName or clicking on a tag) and state (state:Open) using [searcher](https://github.com/radar/searcher)


The application is hosted on heroku:

https://ticketeee.herokuapp.com/

## Development Use:

Clone repo:
   
  ```bash
  $ git clone git@github.com:zapidan/ticketeee.git
  ```

Install gems:

  ```ruby
  bundle install --without production
  ```

Install figaro (needed to create ENV variables to create the admin user from the seeds.rb):

  ```bash
  $ figaro install
  ```

Create email ENV variables in application.yml

  ```yml
  development:
    gmail_username: "your-username@gmail.com"
    gmail_password: "your-password"
  ```
Note: In order for gmail to be able to send emails, you'll need to turn on "Allow less secure apps". It is recommended to disable it once the testing is done: https://myaccount.google.com/u/1/security

Run db migrations and seeding of admin and some demo projects: 

  ```ruby
  rake db:setup
  ```

Start server and enjoy!

  ```ruby
  rails server
  ```