# FitLog
A web application that lets users create fitness logs, map them, and follow each other using the Sinatra Framework, Google Maps API, and AJAX.

## User stories:
* As a user I can sign up and login with an email and password.
* As a user I can create a workout log
* As a user I can follow and unfollow other users asynchronously
* As a user I can view my feed of people I’m following
* As a user I can see the locations of workout logs posted by my followers
* As a user I can see workout logs as pins on google maps
* As a user I can click on those pins and see a google maps info window with the other user’s details
* As a user I can leave comments on other users logs asynchronously

## Screen Shots:
![Home page](/Home_page.png)
![Posting Page](/Feed_page.png)

## Installation
First, run: 

```
bundle install
```

Then, set up your database:

```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

Finally, run the web app locally:

```
bundle exec shotgun
```

