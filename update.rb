while true
  puts "Updating mentions..."
  Mention.retrieve_mentions
  puts "done updating mentions. Replying to those mentions..."
  Mention.reply_mentions
  puts "done replying."

  # Waits one minute and then does it again
  sleep 60
end