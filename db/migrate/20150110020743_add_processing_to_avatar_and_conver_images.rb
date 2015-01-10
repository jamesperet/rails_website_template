class AddProcessingToAvatarAndConverImages < ActiveRecord::Migration
  def change
    add_column :users, :avatar_tmp, :string
    add_column :users, :avatar_processing, :boolean, null: false, default: false
    add_column :blog_posts, :image_tmp, :string
    add_column :blog_posts, :image_processing, :boolean, null: false, default: false
  end
end
