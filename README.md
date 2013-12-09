Portfolio
=========
This is the Portfolio project for the CodeFellows Ruby on Rails bootcamp.  This portfolio
is a showcase of my work and my capabilities.  This portfolios will grow as I implement
what I learn.  See other projects in my repository to see examples that don't fit in well
in the context of my professional portfolio.

[![Build Status](https://travis-ci.org/sprestage/Portfolio.png?branch=master)](https://travis-ci.org/sprestage/Portfolio)[![Code Climate](https://codeclimate.com/github/sprestage/Portfolio.png)](https://codeclimate.com/github/sprestage/Portfolio)[![Coverage Status](https://coveralls.io/repos/sprestage/Portfolio/badge.png)](https://coveralls.io/r/sprestage/Portfolio)[![Security Status](http://rails-brakeman.com/sprestage/portfolio.png)](http://rails-brakeman.com/sprestage/portfolio)[![endorse](https://api.coderwall.com/sprestage/endorsecount.png)](https://coderwall.com/sprestage)

Deployed
========
This portfolio has been deployed to Heroku and can be found here: http://sprestage-portfolio.herokuapp.com


Implementation
=======
(listed most recent to oldest)

######Ajaxification
- Added a use Ajax and jQuery to add a little fun to creating and destroying a post on the index page.

######NewRelic
- Set up NewRelic to ping my deployment at sprestage-portfolio.herokuapp.com
to keep the dyno alive and my site loading quickly.

######Authorship (has_many, :belongs_to)
- Implement <b>authorship</b>.  This links posts to authors(users), using a one (belongs_to) to many (has_many) relationship.

######Rails Authentication with Devise
- Implement <b>user sign up, sign out, sign in</b> with Devise on personal Portfolio

######Implement the Project resource
- Implement <b>show, show index, create, edit, delete projects</b> in personal Portfolio.  Rails MVC Breakdown)

######PostgreSQL
- Implement postgres locally because I think this is a better solution than SQLite
and I would prefer to use in test and development the same environment that I
am used in production.

######CI & Deployment
- Implement Travis and Heroku continuous integration on personal Portfolio and class project Trakehner DB.

######Twitter Bootstrap
- Write a test to check for bootstrap loading on root_path.
- Used RailsCast #328-twitter-bootstrap-basics as a reference.

- Implemented and mildly customized bootstrap.

######Testing with Minitest
- Use generator to create minitests.
- Implement fixtures.

######Implement the Post resource
- Implement <b>create, update, delete posts</b> in personal Portfolio
- Used scaffolding to generate posts.

######Implement Portfolio Rails Application
- This is the first big submission of my official Portfolio.  This implements the custom blog, where the posts can be created, updated, and deleted.

