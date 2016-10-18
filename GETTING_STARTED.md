# Getting Started
Welcome to Tweechable Moments!  This is a guide for new members who want to contribute to the project's technical portion.  Please also read our [Code of Conduct] (CODE_OF_CONDUCT.md) before getting started.

## Sections
### System Requirements
### Install Guidelines
### Running Locally
### Setup a Twitter authentication token
### Testing Tweechable
### Guidelines for submitting a pull request
### Guideliness for pushing a release
### Relevant Resources


## System Requirements
- Git Version 2.10.1
- Ruby Version 2.3.1
- Rails Version 5.0.0.1
- Postgres 9.5.4
- Bundler gem

### Install Guidelines
## Mac Install Guidelines 
We highly recommend using homebrew to install needed components.  Here are further instructions.  Also, check out the helpful advice here https://gist.github.com/mikelikesbikes/3712106678a2aed284da

# Install Homebrew
Check if you have already installed Homebrew.  If you have installed Homebrew, you should see the below.
'
$ which brew
/usr/local/bin/brew
'
If you don't see that, run the below to install homebrew
' ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" '

# Install Git
See if you have git installed
' which git
 /usr/local/bin/git '
 If you don't get a result, run the below to install git.
'brew install git'

# Install a Ruby Manager
We highly recommend you use a Ruby manager, preferably rbenv, to manage your Ruby version.
# Rbenv instructions
First, check if you already have rbenv installed.
' which rbenv 
/usr/local/bin/rbenv
'
If you don't get a result for 'which rbenv', run the below
'$ brew install ruby-build rbenv'

After installing 'rbenv', add the below to your '.bash_profile' to tell your computer to use 'rbenv'
'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi'

# Install Ruby
Use rbenv to see all of the rubies available for install
'$ rbenv install --list'
Will show you all the rubies available for installation
'$ rbenv install 2.3.1'
Will install ruby version 2.3.1
'$ rbenv global 2.3.1'
Will set the global/shell/local ruby

# Install Bundler
'gem install bundler
rbenv rehash'
'gem install sqlite3 pg'


## Non-Mac Install Guidelines

### Running Locally
- A few requirements:
	- You have Ruby on Rails (`rails` and `ruby`, possibly through RVM or rbenv) on your machine
	- You have `git` on your machine
	- You have PSQL (`postgresql`) on your machine
	- You have the `bundler` gem on your machine
- `git clone` the repository to your local machine (see [here](https://help.github.com/articles/cloning-a-repository/) for help)
- Setup your authentication token (see below)
- In terminal:
	- Start *postgres* locally (usually using `psql` command, or `sudo su - postgres`)
	- Create a DB in postgres called *tweechable-development*
	- `cd` into the cloned directory
	- `bundle install` - install all of the needed gems (specified in the Gemfile)
	- `rake db:migrate` - updated your local database schema to the latest point based on the migrations (note that postgres must be running for this to work)
	- `rake db:seed` - fill the database with seed data (note that postgres must be running for this to work)
	- `rails server` - hosts local server at `localhost:3000`

### Setup a Twitter Authentication Token 
- Prerequisites: Register a Twitter account with a phone number. Twitter requires having a phone number for obtaining the authentication tokens 
- Follow the instructions to create a new Twitter app on the [Twitter Apps Panel](https://apps.twitter.com/)
- Go to "Keys and Access Tokens" tab. You should have your consumer key and consumer secret key.
- Scroll down and click "create my access token". 
- Replace the content in quotes with your own tokens in the `app/models/twitter_api.rb` file and you are done :smiley:


### Testing Tweechable
- [Test account on Twitter](https://twitter.com/TweechableTest)
- [Test site](https://tweechable-test.herokuapp.com/)
- You can tweet [@TweechableTest](https://twitter.com/TweechableTest) @*ignorantTwitter* #*AnAvailableLesson*  
- The task is scheduled to run every 10 minutes so the response will take a while, due to limitations of Heroku Scheduler
- Admin panel
	- Production
		- Ask an owner for credentials
	- Local
		- Log in with e-mail *admin@example.org* and password *admin* and go to `http://localhost:3000/admin`

### Relevant Resources
If you are new to Tweechable's tech stack and would like more experience, check out the resources below.
# Ruby
- [Official Ruby Documentation] (ruby-doc.org)
- [Codecademy's Ruby course] (www.codecademy.com/learn/ruby)
- [Learn to Program by Chris Pine] (https://pine.fm/LearnToProgram/)
# Rails
- [Rails Guides] (guides.rubyonrails.org)
- [Rails for Zombies] (https://www.codeschool.com/courses/rails-for-zombies-redux)
- [Rails for Zombies Cheatsheet] (http://courseware.codeschool.com/rails_for_zombies_2_cheatsheets.pdf)
# Twitter API
- [Twitter API Documentation] https://dev.twitter.com/streaming/overview
- [Learn how to use the twitter API] (https://www.codecademy.com/en/tracks/twitter)
- [Tutorial on how to create a twitter bot] (http://www.katelyndinkgrave.com/ruby/2016/01/31/civ-game-generator-twitterbot.html)
