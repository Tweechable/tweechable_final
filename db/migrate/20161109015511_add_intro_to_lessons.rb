class AddIntroToLessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :intro, :string
  end
end