class ChangeLinkToCitedSource < ActiveRecord::Migration
  def up
    rename_column :tweets, :link, :cited_src
  end

  def down
    rename_column :tweets, :cited_src, :link
  end
end
