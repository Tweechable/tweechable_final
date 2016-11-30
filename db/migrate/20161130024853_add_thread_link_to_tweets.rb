class AddThreadLinkToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :thread_link, :string
  end
end
