class AddThumbnailsToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :image, :string
  end
end
