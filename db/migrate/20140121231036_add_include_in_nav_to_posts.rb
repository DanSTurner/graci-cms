class AddIncludeInNavToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :include_in_nav, :boolean, default: true
  end
end
