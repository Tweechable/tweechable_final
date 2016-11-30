module ApplicationHelper
	def tweet_and_url(tweet)
		html = ""

		if session["user_id"].present?
			html = "<p>" + link_to(tweet.text, edit_tweet_path(tweet.id), class: "edit-link")
		else
			html = "<p>" + tweet.text
		end

		if tweet.cited_src
			html += link_to(tweet.cited_src, tweet.link, target: '_blank')
		end

		html += "</p>"
	end
end
