class ChangePostsContentToText < ActiveRecord::Migration
  def change
    change_column :posts, :content, :text, null: false
  end
end
