[![Build Status](https://travis-ci.org/cireficc/yada.svg?branch=master)](https://travis-ci.org/cireficc/yada)
[![Coverage Status](https://coveralls.io/repos/github/cireficc/yada/badge.svg?branch=master)](https://coveralls.io/github/cireficc/yada?branch=master)
[![Code Climate](https://codeclimate.com/github/cireficc/yada/badges/gpa.svg)](https://codeclimate.com/github/cireficc/yada)
[![Dependency Status](https://gemnasium.com/badges/github.com/cireficc/yada.svg)](https://gemnasium.com/github.com/cireficc/yada)
[![Stories in Ready](https://badge.waffle.io/cireficc/yada.png?label=ready&title=Ready)](https://waffle.io/cireficc/yada)

#yada

Yet another dating app!

## API Documentation
The documentation is generated using [Yard-restful](https://github.com/kraft001/yard-restful).
To generate and view the documentation:

1. Run `bundle exec yard doc`
2. Run the Rails server
3. Navigate to `/api/docs/index.html` in a browser

To view what still needs to be documented: `bundle exec yardoc --list-undoc`

## Requirements
- Ruby 2.3.0+
- [Bundler](http://bundler.io) 1.10.6+
- [Foreman](https://github.com/ddollar/foreman) (`gem install foreman`)

## Running migrations

Migrations need to be run for staging and production after changes to the schema:

- `heroku run rake db:migrate --app yada-staging`
- `heroku run rake db:migrate --app yada-production`

## Running Tests

Run `rspec spec` to run the test suite. Code coverage is located in `/coverage`; simply open `index.html` to view it.

## Starting the server

Run `foreman start`!