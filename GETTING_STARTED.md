# Getting Started
Welcome to Tweechable Moments!  This is a guide for new members who want to contribute to the project's technical portion.  We require that new members read our [Code of Conduct](CODE_OF_CONDUCT.md) before getting started.

## Sections
### [System Requirements](#system-requirements-1)
### [Install Guidelines](#install-guidelines-1)
### [Running Locally](#running-locally-1)
### [Setup a Twitter authentication token](#setup-a-twitter-authentication-token-1)
### [Guidelines for submitting a change to tweechable](#guidelines-for-submitting-a-change-to-tweechable-1)
### [Guidelines for maintaining code quality](#guidelines-for-maintaining-code-quality-1)
### [Relevant Resources](#relevant-resources-1)


## System Requirements
- Git Version 2.10.1
- Ruby Version 2.3.1
- Rails Version 5.0.0.1
- Postgres 9.5.4
- Bundler gem

## Install Guidelines
### Mac Install Guidelines
We highly recommend using homebrew to install needed components.  Here are further instructions.

#### Install Homebrew
Check if you have already installed Homebrew.  If you have installed Homebrew, you should see the below.
`$ which brew
/usr/local/bin/brew`
If you don't see that, run the below to install homebrew
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" `

#### Install Git
See if you have git installed
`which git
 /usr/local/bin/git `
 If you don't get a result, run the below to install git.
`brew install git`

#### Install a Ruby Manager
We highly recommend you use a Ruby manager, preferably rbenv, to manage your Ruby version.

##### Rbenv instructions
First, check if you already have rbenv installed.
` which rbenv
/usr/local/bin/rbenv`
If you don't get a result for `which rbenv`, run the below
`$ brew install ruby-build rbenv`

After installing `rbenv`, add the below to your `.bash_profile` to tell your computer to use `rbenv`
`if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi`

#### Install Ruby
Use rbenv to see all of the rubies available for install
`$ rbenv install --list`
Will show you all the rubies available for installation
`$ rbenv install 2.3.1`
Will install ruby version 2.3.1
`$ rbenv global 2.3.1`
Will set the global ruby.  (The global ruby will be used by default in all your work on your local machine.)

#### Install Bundler Gem
`gem install bundler`

### Non-Mac Install Guidelines
`this area is under construction`

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
		- If you don't have postgres, `$brew install postgresql`
		- Start the postgres server: `$pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`
		- To eventually stop the server: `$pg_ctl -D /usr/local/var/postgres stop -s -m fast`
	- Create a DB in postgres called *tweechable_development*
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

### Guidelines for Submitting a Change to Tweechable
 - See something in Tweechable that could be better?  Open an issue!
 - If you want to work an an existing issue, please assign yourself to it and/or comment on it that you are working on it.
- If someone is already working on an issue that interests you, contact them about collaborating.
 - Once you start working on an issue, create a branch on your local machine that starts with the issue number and then summarizes the task (e.g. `95/fix-sign-up-form`)
 - This is Chicago: when working, commit early, commit often.
 - After you finish up your work, push your branch to the tweechable_final repo and open a pull request.
 - Do not merge your own pull request!
 - One technical project maintainer needs to approve and merge your pull request
 - Technical Project Maintainers as of February 2018 are: @McEileen, @vkoves, @javierforero
 - In order to become a technical project maintainer, you should make four (or more) contributions to Tweechable's tech component over a month.  Involvement includes, but is not limited to:
 	- Attending a monthly meeting
 	- Opening issues
 	- Making pull requests
 	- Offering feedback on code
 	- Offering feedback on documentation
 - Only technical project maintainers will make pushes to the twitter bot itself.
 - Only technical project maintainers can make pushes to master
 - Before making a push to production in heroku, you must push to tweechable-staging to ensure changes will not break production
 - If someone is invited to be a contributor for to the tweechable repo, then doesn't contribute to the project for a month, they will be removed as a contributor.

### Guidelines for Maintaining Code Quality
- Write clear, concise commit messages.
- For inspiration on how to write good commit messages, please watch this video [Do Your Commit Messages Suck: by Ryan McGeary](https://www.youtube.com/watch?v=8YjSty6bfog).  We learned of the video through [exercism](exercism.io) - thanks, exercism!
- Write tests.
- Tweechable tracks test coverage with the Travis CI and simplecov gems.  To run simplecov, type `rake test` in terminal and open the generated html file to view test coverage.



### Relevant Resources
If you are new to Tweechable's tech stack and would like more experience, check out the resources below.

#### Ruby
- [Official Ruby Documentation](ruby-doc.org)
- [Codecademy's Ruby course](www.codecademy.com/learn/ruby)
- [Learn to Program by Chris Pine](https://pine.fm/LearnToProgram/)

#### Rails
- [Rails Guides](guides.rubyonrails.org)
- [Rails for Zombies](https://www.codeschool.com/courses/rails-for-zombies-redux)
- [Rails for Zombies Cheatsheet](http://courseware.codeschool.com/rails_for_zombies_2_cheatsheets.pdf)

#### Twitter API
- [Twitter API Documentation](https://dev.twitter.com/streaming/overview)
- [Learn how to use the twitter API](https://www.codecademy.com/en/tracks/twitter)
- [Tutorial on how to create a twitter bot](http://www.katelyndinkgrave.com/ruby/2016/01/31/civ-game-generator-twitterbot.html)

