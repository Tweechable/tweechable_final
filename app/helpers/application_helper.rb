module ApplicationHelper
	def tweet_and_url(tweet)
		html = ""

		if session["user_id"].present?
			html = "<p>" + link_to(tweet.text, edit_tweet_path(tweet.id), class: "edit-link")
		else
			html = "<p>" + tweet.text
		end

		if tweet.link
			html += link_to(tweet.link, tweet.link, target: '_blank')
		end

		html += "</p>"
	end
end
