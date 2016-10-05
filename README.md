# Tweechable is a Twitter service that responds with pre-written content when mentioned on Twitter.  

## Idea originated at Chi Hack Night by Kevin Pujanauski. See more about the project please visit: 
	
- Work group: https://chihacknight.org/breakouts.html 

- Twitter: #tweechablemoments

- Github: https://github.com/Tweechable/tweechable

#### Thanks Kevin for allowing me to develope this idea for my web development final course project. This is NOT the official tweechable repository. 


### To run locally 
- git clone the repository
- use your own authentication token (see below)
- on terminal
	- start *postgres* locally!!! 
	- cd into the directory
	- bundle install
	- rake db:migrate
	- rake db:seed
	- rails server -> localhost:3000


### Use your own authentication token before running locally 
- prereq: register a twitter account and twitter would require your phone number for obtaining the tokens 
- follow the instruction and create a new app here: https://apps.twitter.com/ 
- go to "Keys and Access Tokens" tab. You should have your consumer key and consumer secret key.
- scroll down and click "create my access token". 
- replace the content in quote with your own tokens into your app/models/twitter_api.rb file and you are done :]

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
