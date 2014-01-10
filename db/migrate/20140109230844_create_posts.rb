class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, default: ""
      t.string :content, null: false

      t.timestamps
    end
  end
end
