class AddIndexToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :index, :integer
  end
end
