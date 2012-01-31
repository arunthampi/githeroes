# githeroes

githero.es is a simple web app which lets developers vote for their heroes on GitHub by using their GitHub credentials. It was a weekend project done just before New Years and it surprisingly got featured on [The Next Web](thenextweb.com/apps/2012/01/23/githero-es-lets-you-nominate-your-favorite-rockstar-developers-on-github/).

I decided to open-source it in the hope that its helpful as a starting point for someone trying to setup a Rails 3.1 application. Some of the "fancy" tech which has gone into this is:

* SASS
* Coffeescript
* PostgreSQL Windowing and Ranking
* GitHub OAuth

## Setup

1. Setup PostgreSQL: Unfortunately githero.es doesn't work with databases other than Postgres. You will have to set it up yourself using [brew](https://github.com/mxcl/homebrew) or a package manager of your choice.

2. Setup database.yml: Copy ```config/database.yml.sample``` to ```config/database.yml``` and make sure you have the database specified in ```config/database.yml``` created in PostgreSQL. By default its ```githeroes_development``` for development and ```githeroes_test``` for testing.

3. Setup GitHub keys: You need to [setup a GitHub OAuth application](https://github.com/account/applications/new) and choose whatever name you like. If you're testing out githero.es locally, set the Main URL to be ```http://localhost:3000``` (assuming you're running on port 3000 of course) and set the callback URL to be ```http://localhost:3000/heroes/auth/github/callback```

For production use, change the host to whatever your production host is but the paths remain the same.

4. Specs: There are some specs, which you can run using rspec from the root of the app - ```rspec spec/``` (You need to have setup the test database before you can run specs)

4.1 Setting up the test database schema: After you setup the test database in PostgreSQL, you need to run ```rake db:test:prepare``` for the current database schema to be imported to your test database.

## Happy Hacking!

This is a simple app which was hosted on Heroku and I have no plans to continue to support it. If you'd like to use it, you can under the terms of the MIT License.