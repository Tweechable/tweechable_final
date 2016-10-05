# Tweechable - an educational Twitter service

<img src="app/assets/images/logo.jpg?raw=true" align="right" width="100" alt="Tweechable Logo">

Tweechable is an automatic education Twitter service that provides lessons when mentioned, helping to deal with repeated questions that are asked on Twitter. It helps provide well-written educational lessons on Twitter to ease the burden off of online activists. 

Idea originated at [Chi Hack Night](https://chihacknight.org/) by Kevin Pujanauski.

### Learn More:

- [Github Repository](https://github.com/Tweechable/tweechable)
- [Tweechable Website](https://tweechable.herokuapp.com/)
- Twitter: #tweechablemoments and [@tweechable](https://twitter.com/tweechable)
- [Chi Hack Night Work group](https://chihacknight.org/breakouts.html)

### Tech Stack

 - Hosted on Heroku
 - Built in Ruby on Rails (Rails 4.2.6) using:
	- [Devise](https://github.com/plataformatec/devise) for authentication
 	- [Twitter API](https://github.com/sferik/twitter) for the Twitter bot
 	- [Rails Admin](https://github.com/sferik/rails_admin) for the admin panel

### Running Locally
- `git clone` the repository to your local machine (see [here](https://help.github.com/articles/cloning-a-repository/) for help)
- Setup your authentication token (see below)
- In terminal:
	- start *postgres* locally!!! 
	- cd into the directory
	- `bundle install` - install all of the needed gems (specified in the Gemfile)
	- `rake db:migrate` - updated your local database schema to the latest point based on the migrations
	- `rake db:seed` - fill the database with seed data
	- `rails server` - hosts local server at `localhost:3000`

### Setup a Twitter Authentication Token 
- Prerequisites: Register a Twitter account with a phone number. Twitter requires having a phone number for obtaining the authentication tokens 
- Follow the instructions to create a new Twitter app on the [Twitter Apps Panel](https://apps.twitter.com/)
- Go to "Keys and Access Tokens" tab. You should have your consumer key and consumer secret key.
- Scroll down and click "create my access token". 
- Replace the content in quotes with your own tokens in the `app/models/twitter_api.rb` file and you are done :smiley:

### Feature List
- test acct on twitter: https://twitter.com/TweechableTest
- test site: https://tweechable-test.herokuapp.com/
- you can tweet @TweechableTest @ignorantTwitter #ALessonThat'sAvailable  
- tasks scheduled to run every 10 minutes so the response will take a while...yay free tier
- admin panel: ask me for credential. Locally: log in with E-mail: admin@example.org Password: admin and go to http://localhost:3000/admin 

### Roadmap for improvement:

- Lesson Model: the model currently allows not having any tweets. I want to keep it this way so we can at least collect interesting lessons (hash tag ideas) that others can contribute to. But we should display something like “This lesson doesn’t have any tweets yet! Please contribute to make it better!”

- Twitter API Callback: If the post is successful redirect to display the tweet, if not redirect to a page saying “oh-oh”

- Combine Educatee and Mention aka :through mention but for now I'd rather not (no significant benefit at this point and I don't have the time...)
