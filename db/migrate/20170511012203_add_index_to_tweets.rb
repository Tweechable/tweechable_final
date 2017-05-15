class AddIndexToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_index, :integer, default: 0
    add_index :tweets, :tweet_index
    change_column_null :tweets, :tweet_index, false
  end
end
