# README
This project is a Service Application using MVC architecture - Ruby on Rails. The application is called BookSocial and it works as a Book Social Media where users can exchange information about books, be part of books communities and generate new ideas in the platform. As a no-register user, they can navigate in the platform, read comments about books and search for their favourite books.
In order to have full access to all the features in the platform, the user needs to create their own profile. It will allow them to search for books with an integrated search bar and add them into their own list. They can also edit and remove books from favourites and wishing list. Registered users can connect with friends, add them to their friends list and of course, visit their profiles to see what kind of books they like.
The application consumes one external data feed from Google Books API. It allows the user to search for books in the search bar and bring those books from Google API to our databases. A GEM was built in order to add this functionality.
The development of this application follows the TDD strategy which is explained along this document. It uses continuous integration and delivery strategies (CI/CD). It was developed with iOS and deployed in Heroku.

## Ruby version
Ruby 3.1.0

## System dependencies
This app requires a Postgres database. If you haven't done it already, you can easily install `pg` with the help of your favorite package manager.

If you are on the mac, you can use [Homebrew](https://brew.sh/)
Once that you have `brew` on your system, just run:

```sh
$ brew install postgres@14
```

If you are working on linux, just follow the steps described on Postgres' website for your distro of choice. You can find the instructions right [here](https://www.postgresql.org/download/linux/)


## Configuration
Once you have cloned this repo, you will need to install all dependencies, configure ENV variables and then create and seed the database.

First off, let's install all dependencies (It might take a while the first time.)

```sh
$ bundle install
```

Then, set the _ENV_ variable we use to access Google Books API. (This setting is required by our custom gem `google_books_search`)

```sh
# At the root of the repo:
$ touch .env
$ open .env
```

Then add the `GOOGLE_API_KEY` and set your API Key:

```sh
# .env
GOOGLE_API_KEY=<your-api-key-goes-here>
```

## Database creation
The easiest way to create the database is by using `rake`.

```sh
$ rake db:create
$ rake db:migrate
```

## Database initialization
Once the database is created, we are going to seed some records using another rake task; this time, `db:seed`.

```sh
$ rake db:seed
```

## How to run static code analysis
To ensure the code quality is consistent and up to industry standards, we use
a tool called `rubocop`

The gem is installed automatically by bundler, so to run the static check we only have to do:

```sh
$ bundle exec rubocop
```

If there are issues with the style of our code, missing attributes, indices, and so on, this tool will let us know.

## How to run the test suite
To run the test suite, simple execute this command:

```sh
$ rails test
```

## Deployment instructions
If you haven't done that already, the first step will be to install `heroku CLI`.

On the mac, you can do so with the help of `brew`:

```sh
$ brew tap heroku/brew && brew install heroku
```

If you are running on linux, please follow the instructions described on [Heroku's Dev Center](https://devcenter.heroku.com/articles/heroku-cli).

Once you have `heroku` on your system, run `$ heroku login`. A web browser window will pop up so that you can enter your credentials.

The last step before pushing to **PROD** is to setup a remote that points to our heroku app. To do so, please visit the settings page, grab the git url from there, and then:

```sh
$ git remote add heroku <heroku-app-git-url-here>
```

And finally, to push to prod and kick off the build:

```sh
$ git push heroku master
```

The previous command will print a lot of output on the terminal, but if everything went well, the app is up and running on heroku.

It's important to note that if you are deploying the app for the first time or did any changes to the database schema, after deploying the app, you will have to run `$ heroku run bundle exec rake db:migrate` to propagate those changes on the live app.

To open the app, just run `$ heroku open`. This command will open a web browser windows and navigate to the live app.
