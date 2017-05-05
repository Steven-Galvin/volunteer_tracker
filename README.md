# Volunteer Tracker

This is a basic ruby app that creates projects and assigns them volunteers. Volunteers only have one project at a time, but projects can have many volunteers. This uses a one to many relationship to accomplish.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby
Bundler

### Installing

Installation is quick and easy! First you can clone this repository to your machine, navigate to the file path in your terminal, and run 'app.rb' by typing '$ruby app.rb'. If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browswer. The standard localhost for Sinatra is port 4567.

You will also need to create a database using SQL using these steps:

* Go to the terminal and run 'postgres'
* In a new terminal tab run 'psql'
* In PSQL, type CREATE DATABASE volunteer_tracker;
* then, type \c volunteer_tracker to navigate into the database;
* then, type CREATE TABLE volunteers (id serial PRIMARY KEY, first_name varchar, last_name varchar, project_id int);
* then, type CREATE TABLE projects (id serial PRIMARY KEY, name varchar, description varchar);
* then, type CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

## Built With

* Ruby
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/
* Postgres
* SQL

## User Stories

| behavior |
|----------|
|User can add a project with a description|
|User can edit or delete projects|
|User can add volunteers with first and last names|
|User can add volunteers to projects|
|User can edit or remove volunteers|

## Authors

* Steven Galvin

## License

Copyright (c) 2017 Steven Galvin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
