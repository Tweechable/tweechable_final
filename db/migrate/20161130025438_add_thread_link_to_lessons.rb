class AddThreadLinkToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :thread_link, :string
  end
end
