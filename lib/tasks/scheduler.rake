desc "This task is called by the Heroku scheduler add-on to get tweets"
task :update_mentions => :environment do
  puts "Updating mentions..."
  Mention.retrieve_mentions
  puts "done updating mentions."
end

task :reply_mentions => :environment do
  puts "Replying to mentions..."
  Mention.reply_mentions
  puts "done replying."
end