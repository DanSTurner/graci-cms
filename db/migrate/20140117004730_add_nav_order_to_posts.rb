class AddNavOrderToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :nav_order, :integer, default: 0
  end
end
