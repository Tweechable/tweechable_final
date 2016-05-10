# Tweechable is a Twitter service that responds with pre-written content when mentioned on Twitter.  

## Idea originated at Chi Hack Night by Kevin Pujanauski. See more about the project please visit: 
	- Work group: https://chihacknight.org/breakouts.html 

	- Twitter: #tweechablemoments

	- Github: https://github.com/Tweechable/tweechable

#### Thanks Kevin for allowing me to develope this idea for my web development final course project. This is NOT the official tweechable repository. 


#### To run locally 
	- git clone the repository
	- use your own authentication token (see below)
	- on terminal
		- cd into the directory
		- bundle install
		- rake db:migrate
		- rake db:seed
		- rails server


### Use your own authentication token before running locally 
	- register a twitter account and twitter would require your phone number for you create an APP and obtain the tokens 
	- follow the instruction and create a new app here: https://apps.twitter.com/ 
	- go to "Keys and Access Tokens" tab. You should have your consumer key and consumer secret key.
	- scroll down and click "create my access token". You DO NOT need to "regenerate consumer key and secret"
	- replace the content in quote with your own tokens into your app/models/twitter_api.rb file and you are done :]
